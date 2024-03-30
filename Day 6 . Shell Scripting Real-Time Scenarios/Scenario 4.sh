#!/bin/bash
hosts=("ec2-user@13.235.31.39" "ec2-user@13.235.31.39") # replace host with your hosts

for host in "${hosts[@]}"
do
  set timeout -1 #set timeout to copy all files
  scp -i linux.pem -r files $host:/home/ec2-user #copy all files recursively to remote host
  sleep 1
  echo "Files copied to $host"
done
