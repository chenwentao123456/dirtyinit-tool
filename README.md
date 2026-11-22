# DirtyInit 工具工程 / DirtyInit Toolchain

DirtyInit v1.00（`com.dirty.init`）的**工程化工作目录**：APK 反编译树、payload 生成器、
Material 3 风格 UI 补丁、签名产物、Kirin 990 调优脚本与 sepolicy 参考。

- 官网 / 下载站仓库：<https://github.com/chenwentao123456/dirtyinit>
- 在线站点：<https://chenwentao123456.github.io/dirtyinit/> ・ <http://121.41.93.16/dirtyinit/>

> 仅供**自有设备**的安全研究与系统调优，请勿用于未授权设备。

## 它是什么

DirtyInit 是一条 **page cache（页缓存）篡改** 路径：通过 `IpSecManager` 相关接口在目标
`libbase.so` 上完成一次可控的只读页替换，把 `~LogMessage` 的代码页偷换成一次性跳转，
从而在 `init` 上下文（`u:r:init:s0`, uid 0）里执行几百字节的 ARM64 shellcode。
不写 /system、不改分区、不解锁 BL、不刷 boot，重启即还原。

原始工具 banner 中标注的漏洞编号为 `CVE-2026-43284`（见 `analysis/di_help.txt`）。

## 目录结构

```
apk_src/         apktool 反编译后的原始 APK 树（smali + res + lib，来自 dirtyinit.apk）
generators/      ARM64 payload 生成器（keystone 汇编）与 APK 补丁脚本
payloads/        已生成的 576/592 字节 payload（不同功能分支）
smali_patches/   Material 3 UI 改造补丁（createButton/createLabel/makeBg/md3Text…）
analysis/        逆向分析脚本、命令清单、dmesg 原始输出、设备侧测试脚本
binaries/        dirtyinit ELF（原始 + unpacked）
keystore/        debug 签名用 keystore
sepolicy/        参考用 sepolicy（plat/vendor file_contexts 与 CIL）
scripts/         dirtyinit-hw.sh（Kirin 990 运行时调优，14 个 action）
```

## Payload 分支

生成器统一遵守 `DirtyInitActivity` 的打补丁布局约定（`gen_payload.py` 头注释）：

```
[0x000..0x00F]  entry stub（phase 3 原样拷贝）
[0x010..0x1F7]  code + literals
[0x1F8..0x203]  register restore  (ldp x21,x22 / x19,x20 / x0,x30)
[0x204..0x217]  由 APK 填写原始 prologue
[0x218]         由 APK 填写 B-to-epilogue
[0x21C..0x23F]  padding
```

| 文件 | 大小 | SHA-256（前 16 位） |
|---|---|---|
| `payload_576_adb.bin` | 576 B | `ce8c3ad0cec298ea` |
| `payload_576_bt.bin` | 576 B | `fe55739d3122a16a` |
| `payload_576_cpu.bin` | 576 B | `322824330e6b7e07` |
| `payload_576_cpu_tpl.bin` | 576 B | `3c0b1c362f78d331` |
| `payload_576_direct.bin` | 576 B | `6b62371f28556cd9` |
| `payload_576_mod.bin` | 576 B | `cc47ef5bed970d95` |
| `payload_576_relay_direct.bin` | 592 B | `d23269d24d5c456b` |
| `payload_576_relay_direct2.bin` | 592 B | `37dcfb86d7e57000` |
| `payload_576_sync.bin` | 576 B | `5f9051975088d72d` |
| `payload_576_thoff.bin` | 576 B | `3b052d60b11659d3` |
| `payload_576_thon.bin` | 576 B | `7c1a1188bae624d6` |
| `payload_bt_orig.bin` | 576 B | `fe55739d3122a16a` |

功能摘要：

- `adb`：init 内 fork，向 `/dev/socket/property_service` 发 `service.adb.tcp.port=5555`
  + `ctl.stop/start adbd`，一次性 marker `/dev/.adb55`。
- `bt`：蓝牙 HCI 链路调试功能触发。
- `cpu`：让 init 调 `ctl.restart hwsched-1-0`，hal 重启回来时进入 libbase `LogMessage`，
  非 init 分支直接写 cpufreq 上限/下限（policy0 1954000，policy1 2360000，policy2 2861000）。
- `cpu_tpl`：同上的模板化版本。
- `direct` / `relay_direct` / `relay_direct2`：直接跳转 / relay 直连变体。
- `sync`、`thoff` / `thon`、`mod`：实验分支（同步、温控关闭/开启）。

## 设备相关常量（Kirin 990 / HarmonyOS 4.2 / libbase.so）

```
libbase.so SHA-256  16db270d68dc2f163980668a1bdf388e5dfb656cd9258c7a1afbeec01518f294
_ZN7android4base10LogMessageD1Ev   0x14e20   (size 828)
__system_property_set@plt          0x38810
```

## 构建流程

```bash
# 1. 反编译
apktool d dirtyinit.apk -o apk_src

# 2. 生成 payload（需要 keystone-engine）
python generators/gen_payload.py            # -> payload_576_adb.bin
python generators/gen_payload_cpu.py        # -> payload_576_cpu.bin

# 3. 打 UI 补丁（Material 3 工具面板）
python generators/apply_md3.py             # 用 smali_patches/ 里的 helper 重建 DirtyInitActivity

# 4. 选择 payload 注入点
python generators/patch_payload_select.py  # DirtyInitActivity$7.smali 里的 payload 选择逻辑

# 5. 重新打包 + 签名
apktool b apk_src -o out_unsigned.apk
apksigner sign --ks keystore/di_debug.keystore --out dirtyinit_tools3.apk out_unsigned.apk
```

> 签名产物（`dirtyinit_tools3.apk` / 二合一 / 原版）与校验值见官网仓库的 `downloads/`。

## 调优脚本

`scripts/dirtyinit-hw.sh` 需要 init shell 权限运行：

```
status / selinux / thermal_status / thermal_stop / thermal_restore
mem_status / mem_opt / mem_restore / touch_status / touch_tune / touch_restore
cpu_status / cpu_max / cpu_turbo / cpu_gov / cpu_restore / beast / restore
```

所有运行时修改都可用 `restore` 一键还原；脚本本身不含任何提权 / 漏洞利用代码。

## 注意事项

- 同一次开机只允许干净部署一种 payload，混用可能读到被改过的 `libbase.so` 字节，导致 kernel panic。
- KernelSU 在本机不可行：`CONFIG_MODULE_SIG_FORCE=y` + 华为签名私钥 + `MODVERSIONS=y`，BL 锁定、verity 开启。
- `keystore/` 里是调试签名用的 keystore，仅用于本地复现，勿用于分发。

## 免责声明

仅限自有设备的研究与测试；使用者自行承担一切风险与法律责任。
