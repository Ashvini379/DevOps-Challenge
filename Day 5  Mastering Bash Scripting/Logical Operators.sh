#!/bin/bash

#&& operator
read -p "What is your age?" age
read -p "what is your country?" country
if [[ $age -ge 18 && $country -eq "India" ]]
then
 echo "You can vote"
else
 echo "You cannot vote"
fi


#|| operator
read -p "What is your age?" age
read -p "what is your country?" country
if [[ $age -ge 18 || $country -eq "India" ]]
then
 echo "You can vote"
else
 echo "You cannot vote"
fi

