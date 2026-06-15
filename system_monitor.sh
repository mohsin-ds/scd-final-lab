#!/bin/bash

# Variables
DATE=$(date "+%Y-%m-%d %H:%M:%S")
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
MEMORY_USAGE=$(free -h | grep Mem | awk '{print $3 "/" $2}')

# Function
display_system_info() {
    echo "=============================="
    echo "   SYSTEM MONITOR REPORT"
    echo "=============================="
    echo "Date and Time : $DATE"
    echo "Disk Usage    : $DISK_USAGE"
    echo "Memory Usage  : $MEMORY_USAGE"
    echo "=============================="
}

# Call Function
display_system_info

# Conditional Statement
if [ "${DISK_USAGE%?}" -gt 80 ]; then
    echo "WARNING: Disk usage is critically high!"
else
    echo "STATUS: Disk usage is within normal range."
fi
