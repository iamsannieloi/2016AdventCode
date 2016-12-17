import operator

with open('day6.txt') as f:
    content = f.read().splitlines()

highpassword = ''
lowpassword = ''
for i in range(0,8):
    a = map(operator.itemgetter(i), content )
    d = {}
    for j in a:
        d[j] = d.get(j,0) + 1
    high = sorted(d.items(), key=lambda it:(-it[1], it[0]))
    low = sorted(d.items(), key=lambda it:it[1])
    
    highpassword = highpassword + high[0][0]
    lowpassword = lowpassword + low[0][0]
print "The password for part one is " + highpassword
print "The password for part two is " + lowpassword