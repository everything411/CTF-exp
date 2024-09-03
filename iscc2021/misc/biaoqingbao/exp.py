import zipfile

def extractFile(zFile, password):
    try:
        print("try ", password)
        zFile.extractall(pwd=password)
        print("Found Password:", password)
        return password
    except Exception:
        pass

zFile = zipfile.ZipFile("biaoqingbao.zip")
for month in range(1, 13):
    for day in range(1, 32):
        password = "%02d%02d1999" % (day, month)
        if extractFile(zFile, password.encode()):
            exit(0)
print("not found")
