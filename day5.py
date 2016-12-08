import hashlib

code = 'ojvtpuvg'
counter = 0
counter2 = 0
index = 0
password = ''
password2 = [0,0,0,0,0,0,0,0]
used = []

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False
    
while counter2 < 8:
    combo = code + str(index)
    hexmd5 = hashlib.md5(combo).hexdigest() 
    if hexmd5[0:5] == '00000':
        password = password + hexmd5[5]
        counter += 1
        #Part Two
        if is_number(hexmd5[5]) and int(hexmd5[5]) < 8:
            ihex = int(hexmd5[5])
            if ihex in used:
                index += 1
                continue
            else:
                used.append(ihex)
                password2[ihex] = hexmd5[6]
                counter2 += 1
    index += 1
    
print "The answer for part one is:" + password[0:8]
print "The answer for part two is:" + str(password2)
