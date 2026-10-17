#!/usr/bin/env bash
set -euo pipefail

THRESHOLD=80

echo "===== DISK USAGE MONITOR ====="
date
echo

df -P -x tmpfs -x devtmpfs | awk -v limit="$THRESHOLD" '
NR == 1 { print; next }
{
    usage = $5
    gsub(/%/, "", usage)
    print
    if (usage >= limit)
        print "WARNING: Disk usage is at or above " limit "% on " $6
}
'

echo
echo "Disk monitoring completed."
