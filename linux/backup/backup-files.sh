#!/usr/bin/env bash
set -euo pipefail

SOURCE="$HOME/projects/os-admin"
BACKUP_DIR="$SOURCE/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="$BACKUP_DIR/os-admin-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$ARCHIVE" \
  --exclude="./backups" \
  -C "$SOURCE" .

echo "Backup completed successfully."
echo "Backup file: $ARCHIVE"
echo "Backup size:"
du -h "$ARCHIVE"
