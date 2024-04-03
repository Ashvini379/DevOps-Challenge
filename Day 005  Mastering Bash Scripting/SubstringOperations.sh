#!/bin/bash
string="Hello, world!"
start=7
length=5
substring=$(expr substr "$string" "$start" "$length")
echo "Substring: $substring"

#Get length of string using expr
length=$(expr length "$string") 
echo "The length of the string is: $length"

#substring removal
path="/home/user/documents/file.txt"
base_name="${path##*/}"  #Extracts file.txt 
echo "Base name is $base_name"
