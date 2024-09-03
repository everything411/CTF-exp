import zipfile

def extractFile(zFile, password):
    try:
        print("try ", password)
        zFile.extractall(pwd=password)
        print("Found Password:", password)
        return password
    except Exception as e:
        print(e)

zFile = zipfile.ZipFile("me.zip")
password = "pass1{\u006b\u0072\u0077}"
password = u"\u006b\u0072\u0077"
extractFile(zFile, password.encode("utf16")[2:])
extractFile(zFile, b'\x00k\x00r\x00w')
 
