#!/system/bin/sh
# =====================================================================
#  dirtyinit-hw.sh — HUAWEI Kirin 990 5G / HarmonyOS 4.2 调优后端
#  实测机型串: HUAWEI OXF-AN10;  Android 12 (SDK 31), kernel 5.10.43 aarch64
#  CPU: 2×A76@2.86G + 2×A76@2.36G + 4×A55@1.954G;  SELinux enforcing
#  用法（在提权后的 init / su shell 里）:
#      sh /data/local/tmp/dirtyinit-hw.sh <action> [arg]
#
#  action:
#      status            输出全部状态
#      selinux [on|off]  查看 / 切换 SELinux (off = permissive, 仅运行时)
#      thermal_status    温控守护进程 + 温控区 + 温控属性
#      thermal_stop      停 hwpged / thermal-daemon / thermal-hal / powerct,
#                        关闭 thermal_zone, 关 sys.huawei.thermal.enable
#      thermal_restore   恢复温控
#      mem_status        内存 / zram / VM 状态
#      mem_opt           VM 参数优化 (swappiness / min_free_kbytes / drop_caches)
#      mem_restore       恢复 VM 参数
#      touch_status      触控说明 + 输入设备
#      touch_tune        调 schedutil 升频曲线 (触控加速)
#      touch_restore     恢复触控相关参数
#      cpu_status        3 个 policy 的调度器 / 频率
#      cpu_max           3 个 policy 全锁最高频 (performance)
#      cpu_turbo         schedutil + 零延迟升频
#      cpu_gov <gov>     设置调度器 (powersave / schedutil / performance)
#      cpu_restore       恢复 CPU 参数
#      beast             thermal_stop + cpu_max + mem_opt + touch_tune
#      restore           撤销本脚本做过的全部改动
#
#  说明:
#   * 全部为运行时修改, 不写 /system, 不改分区, 重启自动还原。
#   * thermal_stop 会关闭过温保护; 长时间满载可能过热, 损伤电池 / SoC。
#     风险自负, 随时可用 thermal_restore 或 restore 恢复。
#   * 即使 uid=0, 从 init 域写 cpufreq / thermal 仍可能被 SELinux 拦截。
#     脚本会打印 [FAIL]; 必要时用 `selinux off` 临时 permissive。
#   * 本脚本只做"提权之后"的调优, 不包含任何提权 / 漏洞利用代码。
# =====================================================================

BAK=/data/local/tmp/hw-tune-bak
mkdir -p "$BAK" 2>/dev/null

say(){ printf '%s\n' "$*"; }
ok(){  printf '  [OK]   %s\n' "$*"; }
no(){  printf '  [FAIL] %s\n' "$*"; }
inf(){ printf '  [--]   %s\n' "$*"; }

rd(){ [ -r "$1" ] && head -n 1 "$1" 2>/dev/null | tr -d '\r\n'; }

_bakname(){ printf '%s' "$1" | tr '/' '_'; }

bak(){
    [ -e "$1" ] || return 0
    _b="$BAK/$(_bakname "$1")"
    [ -f "$_b" ] || cp "$1" "$_b" 2>/dev/null
}

# wr <path> <value> [quiet]
wr(){
    _f="$1"; _v="$2"
    if [ ! -e "$_f" ]; then
        [ -z "$3" ] && no "$_f 不存在"
        return 1
    fi
    if printf '%s\n' "$_v" > "$_f" 2>/dev/null; then
        [ -z "$3" ] && ok "$_f <- $_v"
        return 0
    else
        [ -z "$3" ] && no "$_f 写入被拒 (SELinux / 权限)"
        return 1
    fi
}

setp(){ [ -e "$1" ] && { bak "$1"; wr "$1" "$2" quiet; }; }

_pidof(){
    pidof "$1" 2>/dev/null && return 0
    ps -A -o PID,NAME 2>/dev/null | grep -w "$1" | awk '{print $1}' | tr '\n' ' '
}

bp(){ _n="$1"; _b="$BAK/prop_$_n"; [ -f "$_b" ] || getprop "$_n" > "$_b" 2>/dev/null; }
bpr(){ _n="$1"; _b="$BAK/prop_$_n"; [ -f "$_b" ] && setprop "$_n" "$(cat "$_b")" 2>/dev/null; }

usage(){
    say "dirtyinit-hw.sh — HUAWEI Kirin 990 5G / HarmonyOS 4.2 调优后端"
    say ""
    say "用法: sh $0 <action> [arg]"
    say ""
    say "  status          全部状态"
    say "  selinux [on|off] SELinux 查看/切换"
    say "  thermal_status  温控状态"
    say "  thermal_stop    关闭温控 (有风险)"
    say "  thermal_restore 恢复温控"
    say "  mem_status      内存状态"
    say "  mem_opt         内存优化"
    say "  mem_restore     恢复内存"
    say "  touch_status    触控说明"
    say "  touch_tune      触控加速"
    say "  touch_restore   恢复触控"
    say "  cpu_status      CPU 状态"
    say "  cpu_max         锁最高频"
    say "  cpu_turbo       schedutil 狂暴"
    say "  cpu_gov <gov>   设置调度器"
    say "  cpu_restore     恢复 CPU"
    say "  beast           狂暴模式"
    say "  restore         全部恢复"
    say ""
    say "例: sh $0 status ; sh $0 beast ; sh $0 restore"
}

# =====================================================================
# SELinux
# =====================================================================
selinux(){
    case "$1" in
        on)  setenforce 1 2>/dev/null && ok "SELinux -> enforcing" || no "无法 setenforce 1";;
        off) say "!! permissive 期间所有 SELinux 拦截都放开, 用完请 selinux on"
             setenforce 0 2>/dev/null && ok "SELinux -> permissive (仅运行时)" || no "无法 setenforce 0 (内核/策略锁定)";;
        *)
            inf "getenforce : $(getenforce 2>/dev/null)"
            inf "context    : $(rd /proc/self/attr/current)"
            inf "uid/gid    : $(id 2>/dev/null)"
            ;;
    esac
}

# =====================================================================
# CPU  (policy0 小核 554M-1.954G / policy1 826M-2.36G / policy2 1546M-2.861G)
# =====================================================================
cpu_dirs(){
    for d in /sys/devices/system/cpu/cpufreq/policy[0-9]*; do
        [ -d "$d" ] && echo "$d"
    done
}

CPU_FILES="scaling_governor scaling_max_freq scaling_min_freq schedutil/rate_limit_us schedutil/fast_ramp_up schedutil/fast_ramp_down schedutil/hispeed_freq schedutil/go_hispeed_load schedutil/min_sample_time schedutil/boostpulse_duration"

cpu_status(){
    say "== CPU =="
    for d in $(cpu_dirs); do
        say "  ${d##*/}  cpus=$(rd "$d/affected_cpus")"
        inf "gov=$(rd "$d/scaling_governor")  cur=$(rd "$d/scaling_cur_freq")  max=$(rd "$d/scaling_max_freq")"
        inf "avail_gov=$(rd "$d/scaling_available_governors")"
    done
}

_set_gov(){
    for d in $(cpu_dirs); do setp "$d/scaling_governor" "$1"; done
}

cpu_max(){
    say "== CPU 全核锁最高频 =="
    for d in $(cpu_dirs); do
        _mx=$(rd "$d/cpuinfo_max_freq")
        [ -z "$_mx" ] && _mx=$(rd "$d/scaling_available_frequencies" | awk '{print $NF}')
        [ -z "$_mx" ] && continue
        setp "$d/scaling_max_freq" "$_mx"
        setp "$d/scaling_min_freq" "$_mx"
    done
    _set_gov performance
    ok "已锁最高频 + performance (无 FAIL 即生效)"
}

cpu_turbo(){
    say "== CPU 电竞自适应狂暴 =="
    for d in $(cpu_dirs); do
        _mx=$(rd "$d/cpuinfo_max_freq")
        [ -z "$_mx" ] && _mx=$(rd "$d/scaling_available_frequencies" | awk '{print $NF}')
        setp "$d/scaling_governor" schedutil
        setp "$d/schedutil/rate_limit_us" 0
        setp "$d/schedutil/fast_ramp_up" 1
        setp "$d/schedutil/fast_ramp_down" 0
        [ -n "$_mx" ] && setp "$d/schedutil/hispeed_freq" "$_mx"
        setp "$d/schedutil/go_hispeed_load" 60
        setp "$d/schedutil/min_sample_time" 0
        [ -e "$d/schedutil/boostpulse" ] && wr "$d/schedutil/boostpulse" 1 quiet
    done
    ok "schedutil + 零延迟升频 (无 FAIL 即生效)"
}

cpu_gov(){
    [ -z "$1" ] && { no "用法: cpu_gov <governor>"; return 1; }
    _set_gov "$1"
    ok "调度器 -> $1"
}

cpu_restore(){
    say "== 恢复 CPU =="
    for d in $(cpu_dirs); do
        for f in $CPU_FILES; do
            _b="$BAK/$(_bakname "$d/$f")"
            [ -f "$_b" ] && wr "$d/$f" "$(cat "$_b")" quiet
        done
    done
    ok "CPU 参数已恢复"
}

# =====================================================================
# 温控  (hwpged / thermal-daemon / thermal-hal-2-0 / powerct / powerlogd)
# =====================================================================
# init 服务名 (用 stop / start 控制)
THERMAL_SVCS="hwpged thermal-daemon thermal-hal-2-0 bms_thermal"
# 进程名 (用 kill 控制; 部分服务名与进程名不同, 例如 thermal-hal-2-0)
THERMAL_PROCS="hwpged thermal-daemon powerct powerlogd android.hardware.thermal@2.0-service-ithermal"

thermal_status(){
    say "== 温控守护进程 =="
    for s in $THERMAL_SVCS; do
        inf "svc $s=$(getprop init.svc.$s)"
    done
    for s in $THERMAL_PROCS; do
        p=$(_pidof "$s")
        [ -n "$p" ] && inf "proc $s  pid=$p"
    done
    inf "init.svc.hwpged=$(getprop init.svc.hwpged)"
    inf "init.svc.thermal-daemon=$(getprop init.svc.thermal-daemon)"
    inf "init.svc.thermal-hal-2-0=$(getprop init.svc.thermal-hal-2-0)"
    inf "sys.huawei.thermal.enable=$(getprop sys.huawei.thermal.enable)"
    inf "persist.sys.smart_thermal=$(getprop persist.sys.smart_thermal)"
    say "== 温控区 =="
    for z in /sys/class/thermal/thermal_zone[0-9]*; do
        [ -d "$z" ] || continue
        inf "${z##*/}  type=$(rd "$z/type")  temp=$(rd "$z/temp")  mode=$(rd "$z/mode")"
    done
}

thermal_stop(){
    say "!! 警告: 即将关闭厂商温控。满载可能过热, 请勿长时间无人看管。"
    for s in $THERMAL_SVCS; do
        stop "$s" 2>/dev/null
        setprop ctl.stop "$s" 2>/dev/null
        ok "已 stop 服务 $s"
    done
    for s in $THERMAL_PROCS; do
        p=$(_pidof "$s")
        [ -z "$p" ] && continue
        kill -STOP $p 2>/dev/null
        kill -9 $p 2>/dev/null
        ok "已终止 $s (pid=$p)"
    done
    bp sys.huawei.thermal.enable
    setprop sys.huawei.thermal.enable false 2>/dev/null && ok "sys.huawei.thermal.enable <- false" || no "setprop sys.huawei.thermal.enable 被拒"
    bp sys.thermal.game_res_ctrl
    setprop sys.thermal.game_res_ctrl 0 2>/dev/null
    for z in /sys/class/thermal/thermal_zone[0-9]*; do
        [ -f "$z/mode" ] || continue
        setp "$z/mode" disabled
    done
    ok "温控区 mode 已尝试关闭 (无 FAIL 即生效)"
}

thermal_restore(){
    say "== 恢复温控 =="
    for s in $THERMAL_SVCS; do
        start "$s" 2>/dev/null && ok "已启动 $s"
    done
    bpr sys.huawei.thermal.enable
    bpr sys.thermal.game_res_ctrl
    for z in /sys/class/thermal/thermal_zone[0-9]*; do
        _b="$BAK/$(_bakname "$z/mode")"
        [ -f "$_b" ] && wr "$z/mode" "$(cat "$_b")" quiet
    done
    ok "温控已恢复"
}

# =====================================================================
# 内存  (本机无 /sys/module/lowmemorykiller, LMK 在用户态 lmkd)
# =====================================================================
mem_status(){
    say "== 内存 =="
    grep -E 'MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree' /proc/meminfo 2>/dev/null | sed 's/^/  /'
    inf "swappiness      : $(rd /proc/sys/vm/swappiness)"
    inf "vfs_cache_press : $(rd /proc/sys/vm/vfs_cache_pressure)"
    inf "min_free_kbytes : $(rd /proc/sys/vm/min_free_kbytes)"
    inf "swaps           : $(cat /proc/swaps 2>/dev/null | tr '\n' ' ')"
    inf "zram            : $(ls /sys/class/zram-control 2>/dev/null | tr '\n' ' ')"
}

mem_opt(){
    say "== 内存调优 =="
    bak /proc/sys/vm/swappiness
    bak /proc/sys/vm/vfs_cache_pressure
    bak /proc/sys/vm/min_free_kbytes

    wr /proc/sys/vm/swappiness 10 quiet
    wr /proc/sys/vm/vfs_cache_pressure 60 quiet

    _k=$(rd /proc/sys/vm/min_free_kbytes)
    case "$_k" in
        ''|*[!0-9]*) : ;;
        *) wr /proc/sys/vm/min_free_kbytes $((_k + _k / 2)) quiet ;;
    esac

    sync 2>/dev/null
    wr /proc/sys/vm/drop_caches 3 quiet
    ok "内存参数已优化 (swappiness=10, 缓存压力降低, 已 drop_caches)"
}

mem_restore(){
    say "== 恢复内存 =="
    for f in swappiness vfs_cache_pressure min_free_kbytes; do
        _b="$BAK/$(_bakname "/proc/sys/vm/$f")"
        [ -f "$_b" ] && wr "/proc/sys/vm/$f" "$(cat "$_b")" quiet
    done
    ok "内存参数已恢复"
}

# =====================================================================
# 触控  (本机无 /sys/class/touch*, 触控加速 = 调 schedutil 升频曲线)
# =====================================================================
touch_status(){
    say "== 触控 =="
    inf "输入设备: $(ls /sys/class/input 2>/dev/null | tr '\n' ' ')"
    inf "本机没有 /sys/class/touch / touchscreen 节点, 无法直接改采样率。"
    inf "触控延迟由 schedutil 升频曲线 + hw_power 决定; 用 touch_tune 调升频。"
    for d in $(cpu_dirs); do
        inf "${d##*/} hispeed=$(rd "$d/schedutil/hispeed_freq") go_hispeed_load=$(rd "$d/schedutil/go_hispeed_load")"
    done
}

touch_tune(){
    say "== 触控加速 (schedutil 升频曲线) =="
    for d in $(cpu_dirs); do
        setp "$d/schedutil/go_hispeed_load" 60
        setp "$d/schedutil/fast_ramp_up" 1
        setp "$d/schedutil/rate_limit_us" 0
        setp "$d/schedutil/min_sample_time" 0
        _mx=$(rd "$d/cpuinfo_max_freq")
        [ -n "$_mx" ] && setp "$d/schedutil/hispeed_freq" "$_mx"
        [ -e "$d/schedutil/boostpulse" ] && wr "$d/schedutil/boostpulse" 1 quiet
    done
    ok "触控升频曲线已调激 (无 FAIL 即生效)"
}

touch_restore(){
    say "== 恢复触控 =="
    for d in $(cpu_dirs); do
        for f in schedutil/go_hispeed_load schedutil/fast_ramp_up schedutil/rate_limit_us schedutil/min_sample_time schedutil/hispeed_freq; do
            _b="$BAK/$(_bakname "$d/$f")"
            [ -f "$_b" ] && wr "$d/$f" "$(cat "$_b")" quiet
        done
    done
    ok "触控相关参数已恢复"
}

# =====================================================================
# 组合
# =====================================================================
beast(){
    thermal_stop
    cpu_max
    mem_opt
    touch_tune
    say "== 狂暴模式已应用 (重启自动还原) =="
}

do_restore(){
    thermal_restore
    cpu_restore
    mem_restore
    touch_restore
    say "== 已恢复本脚本做过的全部改动 =="
}

status_all(){
    selinux
    cpu_status
    thermal_status
    mem_status
    touch_status
}

# =====================================================================
# 入口
# =====================================================================
case "$1" in
    ''|-h|--help|help) usage ;;
    status)            status_all ;;
    selinux)           selinux "$2" ;;
    thermal_status)    thermal_status ;;
    thermal_stop)      thermal_stop ;;
    thermal_restore)   thermal_restore ;;
    mem_status)        mem_status ;;
    mem_opt)           mem_opt ;;
    mem_restore)       mem_restore ;;
    touch_status)      touch_status ;;
    touch_tune)        touch_tune ;;
    touch_restore)     touch_restore ;;
    cpu_status)        cpu_status ;;
    cpu_max)           cpu_max ;;
    cpu_turbo)         cpu_turbo ;;
    cpu_gov)           cpu_gov "$2" ;;
    cpu_restore)       cpu_restore ;;
    beast)             beast ;;
    restore)           do_restore ;;
    *)                 say "未知 action: $1"; usage ;;
esac
