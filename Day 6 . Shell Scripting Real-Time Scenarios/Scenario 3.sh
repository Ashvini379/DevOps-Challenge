#!/bin/bash
#log file
logFile="/var/log/secure"

#Get failed login ip addressess
ipAddresses=$(cat $logFile | grep sshd | grep -v invalid | awk '{ print $11; }')

#Get location of ip address
getLocation() {
 ip=$1
 location=$(geoiplookup $ip | awk -F ', ' '{ print $2 }')
 if [[ $location == *": "* ]]
 then
    location="${location#*: }"
 fi
 echo $location
}

#display all ip address
for ip in $ipAddresses
do
    noOfFailedAttempt=$(grep -c $ip $logFile)
    location=$(getLocation $ip)
    echo "Ip address=$ip, Location=$location, Failed attempt=$noOfFailedAttempt"
done
