#!/usr/bin/env bash

THRESHOLD=50
FREE_PERCENTAGE=`free | grep Mem | awk '{print $4/$2 * 100.0}'`

if (( $(echo "$FREE_PERCENTAGE < $THRESHOLD" | bc -l) )); then
    echo "Memory usage is high! Free percentage: $FREE_PERCENTAGE"
    ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -nr | head -n10
else
    echo "Memory is OK. Free percentage: $FREE_PERCENTAGE"
fi
