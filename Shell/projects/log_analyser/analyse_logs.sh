#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Enter 1 log file" >&2
    exit 1
elif [ ! -f "$1" ]; then
    echo "File does not exist: $1" >&2
    exit 1
fi

echo " ####### TOP 5 IPs ########### "

# cut -d " " -f 1 $1 | sort | uniq -c | sort -nr | head -5

awk '{print $1}' "$1" | sort | uniq -c | sort -nr | head -5

echo " ####### number of 2xx / 3xx / 4xx / 5xx #######"

echo "2xx: $(awk '{print $9}' "$1" | grep '^2' | wc -l)"
echo "3xx: $(awk '{print $9}' "$1" | grep '^3' | wc -l)"
echo "4xx: $(awk '{print $9}' "$1" | grep '^4' | wc -l)"
echo "5xx: $(awk '{print $9}' "$1" | grep '^5' | wc -l)"

echo "  ####### TOP 5 url ###########"

awk '{print $7}' "$1" | sort | uniq -c | sort -nr | head -5

