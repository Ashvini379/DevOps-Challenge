#!/bin/bash
#How to define array?
myArray=(1 2 3 Hello "Hello World")
echo "All values in array are ${myArray[*]}"

#How to read array values?
echo "Value in first index is ${myArray[0]}"

#How to find length of array?
echo "Length of array is ${#myArray[*]}"

#How to get specific values?
echo "Values form 2-3 ${myArray[*]:2:3}"

#How to update an array?
myArray+=(5 6 8)
echo "Updated array is ${myArray[*]}"

#How to replace value in array?
myArray[1]=10

#Key-value array
#How to define key-value array?
declare -A myArray
myArray=([name] = Ashvini [city] = Pune)
echo "{$myArray[name]}"
