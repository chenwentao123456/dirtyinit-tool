#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Payload CPU template v3 (parameterised) - 576 bytes.

6 independent frequency slots: policy0 min/max, policy1 min/max,
policy2 min/max (9 bytes -> 8 bytes: digits + NUL).

Layout
------
* entry stub + code at the front
* 6 ASCII frequency slots (8 bytes each: up to 7 digits + NUL)
* ctab: 9 entries x 3 bytes = u8 digit_off | u8 name_off | u8 slot_off
  (offsets relative to strbase = prefix start)
* write order per policy: min, max, min (retry; tolerates both
  raising and lowering min/max without knowing current values)
* everything below 0x204 so the native prologue-write region stays free

init branch (uid 0, pid 1):
  * one-shot marker /dev/.dic (APK patches the last two marker bytes,
    giving every deployment a fresh one-shot marker)
  * __system_property_set("ctl.restart", "hwsched-1-0") via libbase PLT

non-init branch (hwsched / other writable domain):
  * dirfd = openat(AT_FDCWD, ".../cpufreq/policy", O_DIRECTORY)
  * for each ctab entry: policy dirfd = openat(dirfd, "<N>", O_DIRECTORY),
    file = openat(policyfd, "scaling_{min,max}_freq", O_WRONLY),
    write(value, strlen(value)), close, close
"""
import json
import struct
import sys

from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

FUNC_OFF = 0x14E20
PLT_PROP_SET = 0x38810

FORBIDDEN = (0x204, 0x220)
NOP4 = bytes([0x1F, 0x20, 0x03, 0xD5])
END = 0x240

SLOT = 8
NSLOT = 6
NENT = 9            # per policy: min, max, min
ENT = 3             # u8 digit_off, u8 name_off, u8 slot_off

# order of SLOT_VALS: [p0min, p0max, p1min, p1max, p2min, p2max]
SLOT_VALS = [b"554000", b"1954000", b"1200000", b"2360000",
             b"1800000", b"2861000"]

MARKER_S = b"/dev/.dic\x00"
RESTART_NAME = b"ctl.restart\x00"
RESTART_VAL = b"hwsched-1-0\x00"
PREFIX_S = b"/sys/devices/system/cpu/cpufreq/policy\x00"
DIGITS = [b"0\x00", b"1\x00", b"2\x00"]
NAMES = [b"scaling_min_freq\x00", b"scaling_max_freq\x00"]

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

    /* ---- init: one-shot marker, then restart hwsched ---- */
    mov x0, #-100
    adr x1, marker
    mov x2, #0xc1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, restore
    mov x8, #57
    svc #0
    adr x0, restart_name
    adr x1, restart_val
    bl #4
    b restore

    /* ---- non-init: write the frequency slots ---- */
noninit:
    mov x0, #-100
    adr x1, prefix
    mov x2, #0x10000
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, restore
    mov x9, x0
    adr x10, ctab
    adr x11, strbase
    mov w12, #9
cf_loop:
    ldrb w1, [x10]
    add x1, x11, x1
    mov x0, x9
    mov x2, #0x10000
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, cf_next
    mov x14, x0
    ldrb w1, [x10, #1]
    add x1, x11, x1
    mov x0, x14
    mov x2, #1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, cf_closedir
    mov x15, x0
    ldrb w1, [x10, #2]
    add x1, x11, x1
    mov w2, #0
cf_len:
    ldrb w3, [x1, x2]
    cbz w3, cf_wr
    add w2, w2, #1
    b cf_len
cf_wr:
    mov x0, x15
    mov x8, #64
    svc #0
    mov x0, x15
    mov x8, #57
    svc #0
cf_closedir:
    mov x0, x14
    mov x8, #57
    svc #0
cf_next:
    add x10, x10, #3
    subs w12, w12, #1
    b.ne cf_loop

restore:
    ldp x21, x22, [sp], #0x10
    ldp x19, x20, [sp], #0x10
    ldp x0, x30, [sp], #0x10
    ret
"""


def align(x, a=4):
    return (x + a - 1) // a * a


def byte_directive(data):
    return ".byte " + ", ".join("0x%02x" % b for b in data)


def place(items, data_start):
    pos = []
    p = data_start
    lo, hi = FORBIDDEN
    for blob in items:
        p = align(p)
        if p < hi and p + len(blob) > lo:
            p = align(hi)
        pos.append(p)
        p += len(blob)
    return pos, p


def build():
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    probe = (CODE + "\nmarker:\nrestart_name:\nrestart_val:\n"
             "strbase:\nprefix:\nctab:\n")
    code_len = len(ks.asm(probe, addr=0)[0])

    data_start = align(code_len)
    slots_blob = b"".join(v.ljust(SLOT, b"\x00")[:SLOT] for v in SLOT_VALS)
    ctab_len = NENT * ENT
    items = [MARKER_S, RESTART_NAME, RESTART_VAL, PREFIX_S,
             b"".join(DIGITS), b"".join(NAMES), slots_blob,
             bytes(ctab_len)]
    pos, end = place(items, data_start)
    if end > END:
        raise SystemExit("overflow end=%#x code=%#x" % (end, code_len))
    (marker_pos, rn_pos, rv_pos, prefix_pos,
     digits_pos, names_pos, slots_pos, ctab_pos) = pos

    strbase = prefix_pos
    digit_offs = []
    p = digits_pos
    for d in DIGITS:
        digit_offs.append(p - strbase)
        p += len(d)
    name_offs = []
    p = names_pos
    for nm in NAMES:
        name_offs.append(p - strbase)
        p += len(nm)
    slot_offs = [slots_pos + i * SLOT - strbase for i in range(NSLOT)]

    entries = []
    for pol in range(3):
        entries.append((pol, 0, pol * 2))      # min
        entries.append((pol, 1, pol * 2 + 1))  # max
        entries.append((pol, 0, pol * 2))      # min again
    ctab = bytearray()
    for pol, nm, slot in entries:
        ctab += bytes([digit_offs[pol], name_offs[nm], slot_offs[slot]])

    for off in digit_offs + name_offs + slot_offs:
        if not (0 <= off < 256):
            raise SystemExit("ctab offset out of range: %d" % off)

    # find the bl #4 placeholder offset by assembling the text before it
    split = CODE.index("bl #4")
    idx = len(ks.asm(CODE[:split] + "\nmarker:\nrestart_name:\nrestart_val:\n"
                     "strbase:\nprefix:\nctab:\nnoninit:\nrestore:\n", addr=0)[0])
    disp = PLT_PROP_SET - FUNC_OFF - idx
    if disp % 4 or not (-(1 << 27) <= disp < (1 << 27)):
        raise SystemExit("bad plt displacement %#x" % disp)

    parts = []
    parts.append(CODE)
    parts.append(".org 0x%x" % marker_pos)
    parts.append("marker:")
    parts.append(byte_directive(MARKER_S))
    parts.append("restart_name:")
    parts.append(byte_directive(RESTART_NAME))
    parts.append("restart_val:")
    parts.append(byte_directive(RESTART_VAL))
    parts.append(".org 0x%x" % prefix_pos)
    parts.append("strbase:")
    parts.append("prefix:")
    parts.append(byte_directive(PREFIX_S))
    parts.append(".org 0x%x" % digits_pos)
    parts.append("digits:")
    for d in DIGITS:
        parts.append(byte_directive(d))
    parts.append(".org 0x%x" % names_pos)
    parts.append("names:")
    for nm in NAMES:
        parts.append(byte_directive(nm))
    parts.append(".org 0x%x" % slots_pos)
    parts.append("slots:")
    parts.append(byte_directive(slots_blob))
    parts.append(".org 0x%x" % ctab_pos)
    parts.append("ctab:")
    parts.append(byte_directive(bytes(ctab)))
    parts.append(".org 0x%x" % FORBIDDEN[0])
    parts.append(byte_directive(NOP4 * ((FORBIDDEN[1] - FORBIDDEN[0]) // 4)))
    parts.append(".org 0x%x" % END)
    blob2 = bytearray(ks.asm("\n".join(parts), addr=0)[0])
    if len(blob2) != END:
        raise SystemExit("assembled size %#x" % len(blob2))
    blob2[idx:idx + 4] = struct.pack("<I", 0x94000000 | ((disp >> 2) & 0x3FFFFFF))

    meta = {
        "size": len(blob2),
        "code_len": code_len,
        "data_start": data_start,
        "data_end": end,
        "marker_off": marker_pos,
        "marker_suffix_off": marker_pos + 7,
        "slots": [slots_pos + i * SLOT for i in range(NSLOT)],
        "slot_len": SLOT,
        "ctab_off": ctab_pos,
        "bl_at": idx,
    }
    return bytes(blob2), meta


if __name__ == "__main__":
    blob, meta = build()
    print("meta:", json.dumps({k: ([hex(x) for x in v] if isinstance(v, list)
                                   else hex(v) if isinstance(v, int) else v)
                                for k, v in meta.items()}, indent=2))
    print("entry:", blob[0:16].hex())
    out = sys.argv[1] if len(sys.argv) > 1 else "payload_576_cpu_tpl.bin"
    open(out, "wb").write(blob)
    print("written", out, len(blob))
