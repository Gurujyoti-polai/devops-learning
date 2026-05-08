#!/bin/bash

# DevOps script: Monitor log file for errors
# Usage: ./check_logs.sh /path/to/logfile

LOGFILE=${1:-/var/log/syslog}
ERROR_COUNT=$(grep -i "error" "$LOGFILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$LOGFILE" | wc -l)

echo "=== Log Analysis Report ==="
echo "File: $LOGFILE"
echo "Errors found: $ERROR_COUNT"
echo "Warnings found: $WARNING_COUNT"

if [ $ERROR_COUNT -gt 10 ]; then
    echo "⚠️  High error count detected!"
    exit 1
else
    echo "✓ Log health looks good"
    exit 0
fi
