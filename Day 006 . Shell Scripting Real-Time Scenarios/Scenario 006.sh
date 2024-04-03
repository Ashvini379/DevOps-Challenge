#!/bin/bash
logFile="path/logfile" #replace with your log file
outputFile="/path/output.txt" #output file

#pattern to be searched in file
pattern="pattern"

#parse file search pattern and save it to output file
grep "$pattern" "$logFile" | awk '{ print $1, $2, $3 }' > "$outputFile"

echo "Parsing complete, saved to #outputFile"
