#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Enter 1 log file"
elif [ "$1" != "logs.txt" ]; then
    echo "Enter the correct log file"
fi

echo " ####### TOP 5 IPs ########### "

cut -d " " -f 1 logs.txt | sort | uniq -c | sort -nr | head -5

echo " ####### number of 2xx / 3xx / 4xx / 5xx #######"

awk '{print $9}' logs.txt | sort | uniq -c | sort -nr | head -5

echo "  ####### TOP 5 url ###########"

awk '{print $7 $8}' logs.txt | sort | uniq -c | sort -nr | head -5




