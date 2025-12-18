# Linux Automation – Backup, Monitoring & Recovery Suite
---

## 📌 Project Overview
This project implements a production-style Linux automation solution for data backup, monitoring, and recovery.
It is designed and tested on an AWS EC2 Ubuntu instance using native Linux tools and Bash scripting.

The goal is to demonstrate real-world DevOps practices such as automation, observability, recovery validation,
log management, and clean Git workflows.

---

## ❓ Real-World Problem
In production environments:
- Data loss can occur due to human error, disk failure, or application issues
- Manual backups are unreliable and error-prone
- Lack of monitoring leads to silent failures
- Uncontrolled logs can consume disk space

This project addresses these issues using lightweight, Linux-native tooling.

---

## 🏗️ Architecture & Flow
1. Application data is backed up using incremental rsync backups
2. Each backup is stored in a timestamped directory
3. System health (CPU, memory, disk) is monitored at regular intervals
4. All activities are logged and rotated to prevent disk exhaustion
5. Restore tests validate that backups are usable

---

## 📁 Project Structure
```text
linux-backup-project/
├── scripts/
│   ├── backup.sh      # Incremental backup script using rsync
│   ├── monitor.sh     # CPU, memory, disk monitoring with alerts
│   └── restore.sh     # Restore data from a selected backup
├── config/            # Reserved for future configurations
├── notes/             # Learning notes and observations
├── backup/            # Runtime backup data (gitignored)
└── logs/              # Runtime logs (gitignored)
```
---

## ⚙️ Scripts Explained

🔹 backup.sh

- Uses rsync for incremental backups

- Creates timestamped backup directories

- Logs success and failure states

- Designed for cron and systemd execution


🔹 monitor.sh

- Checks CPU, memory, and disk usage

- Logs system metrics with timestamps

- Generates alerts when thresholds are crossed

🔹 restore.sh

- Restores data from a selected backup directory

- Used to validate backup integrity

---

## ⏱️ Automation

- Cron Jobs

- Backup and monitoring scripts are scheduled using cron

- Example:

```bash
*/5 * * * * monitor.sh
```

- Systemd Integration

- Backup script is also configured as a oneshot systemd service

- Allows execution tracking and service-level management

---

## 🔄 Restore Test Example

- Delete a file from the source directory

- Restore data using restore.sh

- Verify file recovery

- Confirm backup usability
```text
 "Backup without restore testing is incomplete."
```

---

## 🧪 Tech Stack

- Linux (Ubuntu)

- Bash scripting

- rsync

- Cron

- systemd

- Logrotate

- AWS EC2

- Git & GitHub

---

## 📚 Key Learnings

- Incremental backups using ```rsync```

- Importance of restore validation

- ```Cron``` vs ```systemd``` responsibilities

- Log management with logrotate

- Production-ready folder structure

- Clean Git practices using .gitignore

---

## 🚀 Future Improvements

- Remote backups to S3 or NFS

- Email or Slack alerting

- Configuration management

- Centralized logging

- CI/CD integration

--- 
---

