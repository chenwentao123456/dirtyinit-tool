#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
A': original relay payload, but every return path is redirected to a custom
"pop regs + ret" tail appended at 0x240, so it does NOT depend on the APK
patcher's prologue/NOP-slot patch. This makes it safe to deploy on top of an
already-modified libbase (second deployment), while the relay child (forked on
first init LOG) keeps running from the new payload bytes.

Kept below the function epilogue (+636) so the APK's native RET discovery still
works on a second deployment.
"""
import struct
import sys

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

ORIG = r"C:\Users\tian1\Documents\deepseek-harness\default-workspace\apk\unpacked\assets\payload_576.bin"
OLD_TARGET = 0x1F8
NEW_TARGET = 0x240

data = bytearray(open(ORIG, "rb").read())
assert len(data) == 576
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = True

patched = []
for ins in md.disasm(bytes(data), 0):
    if ins.address >= 0x1F8:
        continue
    mnem = ins.mnemonic
    target = None
    if mnem in ("b", "b.eq", "b.ne", "b.hs", "b.lo", "b.mi", "b.pl", "b.vs", "b.vc",
                "b.hi", "b.ls", "b.ge", "b.lt", "b.gt", "b.le", "cbz", "cbnz",
                "tbz", "tbnz"):
        try:
            target = ins.operands[-1].imm
        except Exception:
            target = None
    if target == OLD_TARGET:
        word = struct.unpack_from("<I", data, ins.address)[0]
        off = (NEW_TARGET - ins.address) >> 2
        if mnem in ("cbz", "cbnz"):
            # 0x34000000 cbz / 0x35000000 cbnz (32-bit), imm19 = off
            base = word & 0x7F000000
            new = base | ((off & 0x7FFFF) << 5) | (word & 0x1F)
            patched.append((ins.address, mnem, target, new))
            struct.pack_into("<I", data, ins.address, new)
        elif mnem in ("tbz", "tbnz"):
            b5 = (word >> 31) & 1
            b40 = (word >> 19) & 0x3F
            rt = word & 0x1F
            imm14 = (NEW_TARGET - ins.address) >> 2
            base = 0x36000000 | (b5 << 31)
            new = base | (b40 << 19) | ((imm14 & 0x3FFF) << 5) | rt
            patched.append((ins.address, mnem, target, new))
            struct.pack_into("<I", data, ins.address, new)
        else:
            cond = word & 0xF
            imm19 = (NEW_TARGET - ins.address) >> 2
            new = 0x54000000 | ((imm19 & 0x7FFFF) << 5) | cond
            patched.append((ins.address, mnem, target, new))
            struct.pack_into("<I", data, ins.address, new)

print("patched branches:")
for a, m, t, w in patched:
    print("  %#04x %-5s -> %#x   new=%#010x" % (a, m, t, w))

assert patched, "no branch patched"

# custom restore tail at 0x240: pop the three saved pairs, then ret
tail = bytes.fromhex(
    "f5 5b c1 a8"   # ldp x21, x22, [sp], #0x10
    "f3 53 c1 a8"   # ldp x19, x20, [sp], #0x10
    "e0 7b c1 a8"   # ldp x0, x30, [sp], #0x10
    "c0 03 5f d6"   # ret
)
data = data[:0x240] + tail
assert len(data) == 0x250

open(sys.argv[1] if len(sys.argv) > 1 else "payload_576_relay_direct.bin", "wb").write(data)
print("wrote", len(data), "bytes")

# verify: all old-target branches now target 0x240, and 0x240 decodes
print("--- verify ---")
d2 = bytes(data)
for ins in Cs(CS_ARCH_ARM64, CS_MODE_ARM).disasm(d2, 0):
    if ins.address in [p[0] for p in patched]:
        print("%#04x %s %s" % (ins.address, ins.mnemonic, ins.op_str))
for ins in Cs(CS_ARCH_ARM64, CS_MODE_ARM).disasm(d2[0x240:], 0x240):
    print("%#04x %s %s" % (ins.address, ins.mnemonic, ins.op_str))
