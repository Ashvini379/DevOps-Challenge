#!/bin/bash
if [[ $# -eq 0 ]]
then
 echo "Please provide atleast one argument"
 exit 1
fi
addition() {
    let num1=$1
    let num2=$2
    let sum=$num1 + $num2
    echo "sum of $num1 and $num2 is $sum"
}
#to call a function
addition 10 20
