#!/bin/bash
#Assign values to variable directly
city="Pune"
echo "city name is $city"

#!/bin/bash
#Assign value based on output from another command
HOSTNAME=$(hostname)
echo "Hostname is $HOSTNAME"

#!/bin/bash
#Constant variables
readonly city="Pune"
echo "city name is $city"
city = "Mumbai"
