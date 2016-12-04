import re

sum = []
total = 0
with open('day4.txt') as f:
    content = f.read().splitlines()
    
    for line in content:
        encrypt = line.split('[')
        count = {}
        word = encrypt[1][:-1]
        code = encrypt[0].split('-')
        
        message = ''
        for i in code[:-1]:
            for j in i:
                if count.has_key(j):
                    count[j] = count[j] + 1
                else:
                    count[j] = 1
                    
                #Part TWOOOOOOOOOOOO
                change = (int(code[-1]) % 26 - 97)
                new = chr(((change + ord(j)) % 26)+97)
                message = message + new
            message = message + ' '
        if re.match('north', message):
            print "The sector id of the north pole objects storage is:" + str(code[-1])
                #END OF PART TWO
                
        first = []
        for item in sorted(count.items(), key=lambda it:(-it[1], it[0])):
            first.append(item)
        x = ''
        for letter in first[0:5]:
            x = x + letter[0]
     
        if word == x:
            sum.append(code[-1])
            
for numbers in sum:
    total = total + int(numbers)
            
print "The total sum of sector ids is: " + str(total)


                
                