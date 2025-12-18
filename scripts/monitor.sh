#!/bin/bash

LOG_FILE="/home/ubuntu/linux-backup-project/logs/monitor.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

#===== Thresholds =====
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=75

echo "[$TIMESTAMP] Monitoring check started" >> "$LOG_FILE"

#===== CPU Usage =====
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}

#===== Memory Usage =====
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

#===== Disk Usage =====
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

#===== Alerts =====
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: High CPU usage - ${CPU_USAGE}%" >> "$LOG_FILE"
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: High Memory usage - ${MEM_USAGE}%" >> "$LOG_FILE"
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "[$TIMESTAMP] ALERT: High Disk usage - ${DISK_USAGE}%" >> "$LOG_FILE"
fi

echo "[$TIMESTAMP] Monitoring check completed" >> "$LOG_FILE"
echo "[$TIMESTAMP] CPU=${CPU_USAGE}% MEM=${MEM_USAGE}% DISK=${DISK_USAGE}%" >> "$LOG_FILE"

