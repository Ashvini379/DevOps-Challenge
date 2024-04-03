#!/bin/bash
count=0
num=10
while [[ $count -le $num ]]
do
 echo "Numbers are $count"
 let count++
done


#while loop to read content from a file

while read myVar
do
 echo "Value from file $myVar"
done < names.txt

#while loop to read content from csv file
while IFS="," read id name age
do
 echo "Id is $id "
 echo "name is $name"
 echo "age is $age"
done < names.csv
