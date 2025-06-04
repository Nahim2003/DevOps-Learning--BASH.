#!/bin/bash

# Usage: ./backup_rotate.sh /path/to/source /path/to/backup_dir

# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /source/directory /backup/location"
    exit 1
fi

SOURCE_DIR="$1"
BACKUP_DIR="$2"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

echo "✅ Backup created: $BACKUP_NAME"

# Rotate: keep only the 5 newest backups
cd "$BACKUP_DIR" || exit
BACKUP_COUNT=$(ls backup_*.tar.gz 2>/dev/null | wc -l)

if [ "$BACKUP_COUNT" -gt 5 ]; then
    echo "♻️ Rotating old backups..."
    ls -1t backup_*.tar.gz | tail -n +6 | xargs rm -f
fi

