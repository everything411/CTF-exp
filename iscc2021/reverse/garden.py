# Source Generated with Decompyle++
# File: garden.pyc (Python 2.7)

import platform
import sys
import marshal
import types
# ISCC{Makka2021Pakka}
def check(s):
    f = '2(88\x006\x1a\x10\x10\x1aIKIJ+\x1a\x10\x10\x1a\x06'
    if len(s) != len(f):
        return False
    checksum = None
    for a, b in zip(f, s):
        checksum += ord(b) ^ ord(a) ^ 123
    
    return checksum == 0

if sys.version_info.major != 2 or sys.version_info.minor != 7:
    sys.exit('\xe8\xaf\x95\xe8\xaf\x95 Python 2.7.')
if len(sys.argv) != 2:
    sys.exit('usage: bronze.pyc <flag>')
flag = sys.argv[1]
if len(flag) >= 32:
    print '\xe5\xa4\xaa\xe9\x95\xbf\xe4\xba\x86.'
    sys.exit(1)
alphabet = set('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}!@#$%+')
for ch in flag:
    if ch not in alphabet:
        print '\xe4\xb8\x8d\xe5\xaf\xb9.'
        sys.exit(1)
        continue
if check(flag):
    print '\xe5\xb0\xb1\xe6\x98\xaf\xe8\xbf\x99\xe4\xb8\xaa!'
    sys.exit(0)
else:
    print '\xe6\x90\x9e\xe9\x94\x99\xe4\xba\x86.'
    sys.exit(1)
