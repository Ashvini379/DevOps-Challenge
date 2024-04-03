#!/bin/bash
echo "hey choose an option"
echo "a = To see current date"
echo "b = list all files in current directory"

read choice
case $choice in
    a)date;;
    b)ls;;
    *) echo "Please provide valid input"
esac
