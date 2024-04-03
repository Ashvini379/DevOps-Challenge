#!/bin/bash
#For loop

for i in 1 2 3 4 5
do
 echo "1) Number is $i"
done

#other ways to write for loop

for i in {1..5}
do
 echo "2) Number is $i"
done

#C-Style loop
for (( i=1 ; i<=5 ; i++ ));
do
 echo "3) Number is $i"
done

#For loop for reading array
s=("football" "cricket" "hockey") 
for n in ${s[@]}; 
do
    echo $n
done
