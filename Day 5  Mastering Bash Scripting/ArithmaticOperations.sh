#!/bin/bash
#Using let command
x=10
y=2
let mul=$x*$y
echo "Multiplication is $mul"

#using brackets
echo "multiplication is $(($x * $y))"
