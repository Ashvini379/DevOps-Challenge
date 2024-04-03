#!/bin/bash
function welcomeNote {
echo "----------------------------------------"
echo "Welcome"
echo "----------------------------------------"
}

#To call a function
welcomeNote
welcomeNote
welcomeNote
welcomeNote
#function with braces
welcomeNote() {
echo "----------------------------------------"
echo "Welcome in brace function"
echo "----------------------------------------"
}

#To call a function
welcomeNote
welcomeNote
welcomeNote
welcomeNote

addition() {
 let num1=$1
 let num2=$2
 let sum = $num1+$num2
 echo "sum of $num1 and $num2 is $sum"
}
#to call a function
addition 10 20
#To get no. of arguments : $#
#To display all arguments : $@
#To use or display arguments : $1 ,$2
