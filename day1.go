package main

import ( 
		"fmt" 
		"strings"
		"strconv"
		"math"
)

var input = "R1, L4, L5, L5, R2, R2, L1, L1, R2, L3, R4, R3, R2, L4, L2, R5, L1, R5, L5, L2, L3, L1, R1, R4, R5, L3, R2, L4, L5, R1, R2, L3, R3, L3, L1, L2, R5, R4, R5, L5, R1, L190, L3, L3, R3, R4, R47, L3, R5, R79, R5, R3, R1, L4, L3, L2, R194, L2, R1, L2, L2, R4, L5, L5, R1, R1, L1, L3, L2, R5, L3, L3, R4, R1, R5, L4, R3, R1, L1, L2, R4, R1, L2, R4, R4, L5, R3, L5, L3, R1, R1, L3, L1, L1, L3, L4, L1, L2, R1, L5, L3, R2, L5, L3, R5, R3, L4, L2, R2, R4, R4, L4, R5, L1, L3, R3, R4, R4, L5, R4, R2, L3, R4, R2, R1, R2, L4, L2, R2, L5, L5, L3, R5, L5, L1, R4, L1, R1, L1, R4, L5, L3, R4, R1, L3, R4, R1, L3, L1, R1, R2, L4, L2, R1, L5, L4, L5"
var start  = [2]int{0, 0}

func calculateDistance()(float64) {
	var x = math.Abs(float64(start[0] - 0))
	var y = math.Abs(float64(start[1] - 0))

	return x+y 
}

func getPosition(position, steps int) {
	if position == 0 {
		start[1] = start[1] + steps
	} else if position == 1 {
		start[0] = start[0] + steps
	} else if position == 2 {
		start[1] = start[1] - steps
 	} else if position == 3 {
 		start[0] = start[0] - steps
 	}
}

func findMyWay(directions string) {

	
	//Using ints as cardinal directions 0 = N, 1 = E, 2 = S, 3 = W
	var cardinal = 0
	var move []string = strings.Split(input, ", ")
	for _, v := range move {
			if v[:1] == "R" {
				cardinal += 1
				if cardinal > 3 {
					cardinal = 0
				}
			} else{
				cardinal -= 1
				if cardinal < 0 {
					cardinal = 3
				}
			}

			//converts string to int
			i, err := strconv.Atoi(v[1:])
			if err != nil {
				fmt.Println(err)
			}
			getPosition(cardinal, i)
	}
	var final = calculateDistance()
	fmt.Println(final)
}

func main() {
	findMyWay(input)
}