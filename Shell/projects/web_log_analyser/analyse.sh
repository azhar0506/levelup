#!/bin/bash
LOG_FILE="web.log"
report="reports/report-$(date +%Y%m%d).txt"





case "$1" in
    summary)
        wc -l $LOG_FILE  # Total number of requests
        ;;
    response)
        grep "$2" "$LOG_FILE" | wc -l   # how many responses in each status code
        ;;
    top-ips)
        cut -d ' ' -f 1 $LOG_FILE| sort | uniq -c | sort -nr | head  -5   # top 5 IPs by request count
        ;;
    top-urls)
        cut -d ' ' -f 7 $LOG_FILE | sort | uniq -c | sort -nr | head  -5  # top 5 most requested url
        ;;
    top-status)
        cut -d ' ' -f 9 $LOG_FILE | sort | uniq -c # Requests per status code
        ;;
    daily-report)
        {
            echo "=== Daily Report ==="
            echo "Total requests: $(wc -l < "$LOG_FILE")"
            echo
            echo "Status codes:"
            cut -d ' ' -f9 "$LOG_FILE" | sort | uniq -c
            echo
            echo "Top IPs:"
            cut -d ' ' -f1 "$LOG_FILE" | sort | uniq -c | sort -nr | head -3
            echo
            echo "Top URLs:"
            cut -d ' ' -f7 "$LOG_FILE" | sort | uniq -c | sort -nr | head -3
        } > "$report"
        ;;
esac
