#!/bin/bash
num=10
until [[ $num -eq 1 ]]
do
 echo "Value of num is $num"
 num=$((num-1))
done
echo "num value is $num"
echo "loop terminated"
