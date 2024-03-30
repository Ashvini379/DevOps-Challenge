#!/bin/bash
ALERT=80
computestats() {
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
if [[ $MEMORY -ge $ALERT ]] #ALert for out of memory
then
    echo "Out of memory $MEMORY"
fi

DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
if [[ $DISK -ge $ALERT ]] #ALert for out of memory
then
    echo "Disk out of space $DISK"
fi
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
if [[ $CPU -ge $ALERT ]] #ALert for out of memory
then
    echo "More CPU utilization $CPU"
fi
echo "$MEMORY$DISK$CPU"
sleep 5
done
}

#copy output to file
computestats >> stats.txt
