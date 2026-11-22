import sys
from capstone import *

path = sys.argv[1]
data = open(path,'rb').read()
print("len", len(data))
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = False
for ins in md.disasm(data, 0x1000):
    print(f"0x{ins.address-0x1000:04x}: {ins.bytes.hex():16s} {ins.mnemonic:8s} {ins.op_str}")
