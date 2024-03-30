 #!/bin/bash
#output file
outputFile="loggedinusers.txt"
checkLoggedInUsers() {
    date=$1
    who -v d="$date" | awk '{print $3" "$1}' | sort | uniq >> $outputFile
}

#Enter date
echo "Enter date in format: YYYY-MM-DD"
read date
checkLoggedInUsers date
