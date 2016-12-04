

def isTriangle( sides ):
    side1 = int(sides[0])
    side2 = int(sides[1])
    side3 = int(sides[2])    
    if ((side1 + side2) > side3) and ((side1 + side3) > side2) and ((side2 + side3) > side1):
        return 1 
    else:
        return 0

def trianglePerColumn():
    with open('day3.txt') as f:
        content = f.read().splitlines()    
    column = []
    triangle = 0
    for line in content:
        row = line.split()
        column.append(row)
        if len(column) == 3:
            for i in range(0, len(column)):
                x = [ column[0][i], column[1][i], column[2][i] ]
                if (isTriangle(x)):
                    triangle += 1
            column = []
    print "Number of proper triangles per column: " + str(triangle)
    f.close()


def trianglePerLine():
    triangle = 0
    with open('day3.txt') as f:
        content = f.read().splitlines()    
    for line in content:
        sides = line.split()
        if ( isTriangle(sides)):
            triangle += 1
 
    print "Number of proper triangles per line: " + str(triangle)
    f.close()
        
trianglePerLine()
trianglePerColumn()