import hashlib
hash = hashlib.md5()

filename='/fllllllllllllaaaaaag'
cookie_secret="ef57c331-744f-4528-b434-9746317d4f6a"
hash.update(filename.encode('utf-8'))
s1=hash.hexdigest()
hash = hashlib.md5()
hash.update((cookie_secret+s1).encode('utf-8'))
print(hash.hexdigest())
