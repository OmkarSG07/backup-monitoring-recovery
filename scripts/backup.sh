#!/bin/bash

# ========= CONFIG =========
SOURCE_DIR="/var/www/data"
BACKUP_BASE="/home/ubuntu/linux-backup-project/backup"
LOG_FILE="/home/ubuntu/linux-backup-project/logs/backup.log"

# ========= TIMESTAMP =========
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
DEST_DIR="$BACKUP_BASE/$TIMESTAMP"

# ========= LOG START =========
echo "[$(date)] Backup started" >> "$LOG_FILE"

# ========= CREATE BACKUP DIR =========
mkdir -p "$DEST_DIR"

# ========= RUN BACKUP =========
rsync -av --delete "$SOURCE_DIR/" "$DEST_DIR/" >> "$LOG_FILE" 2>&1
STATUS=$?

# ========= CHECK RESULT =========
if [ $STATUS -eq 0 ]; then
	echo "[$(date)] Backup SUCCESS" >> "$LOG_FILE"
else
	echo "[$(date)] Backup Failed with Status $STATUS " >> "$LOG_FILE"
fi
