#!/bin/bash
#If-else conditions

read -p "Enter your marks: " marks
if [[ $marks -gt 40 ]]
then
 echo "You are PASS"
else
 echo "You are FAIL"       
fi


#elif condition
read –p "Enter your marks: " marks
if [[$marks –g6 80]]
then
               echo "First Division"
elif [[$marks –ge 60]]
then
               echo "Second Division"
else
               echo "You are FAIL"       
fi
