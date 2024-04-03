#!/bin/bash
#Enter start date
echo "Enter start date:"
read startdate
startdate=$(date -d $startdate +%Y-%m-%d) # format in YYYY-MM-DD

#Enter end date
echo "Enter end date:"
read enddate
enddate=$(date -d $enddate +%Y-%m-%d)
echo "Size\ttDate"
find /home/ec2-user -type f -newermt $startdate ! -newermt $enddate -ls | awk '{print $7" "$8" "$9}'Write a shell script to automate the process of updating a list of servers with the latest security patches.
