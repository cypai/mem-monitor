#!/usr/bin/env bash

THRESHOLD=90
USED_PERCENTAGE=`free | grep Mem | awk '{print $3/$2 * 100.0}'`
FREE_PERCENTAGE=`free | grep Mem | awk '{print $4/$2 * 100.0}'`

if (( $(echo "$FREE_PERCENTAGE < $THRESHOLD" | bc -l) )); then
    echo "Memory usage is high!"
	echo "Used percentage: $USED_PERCENTAGE"
	echo "Free percentage: $FREE_PERCENTAGE"
    ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -nr | head -n10
    exit 1
else
    echo "Memory is OK."
	echo "Used percentage: $USED_PERCENTAGE"
	echo "Free percentage: $FREE_PERCENTAGE"
    exit 0
fi
