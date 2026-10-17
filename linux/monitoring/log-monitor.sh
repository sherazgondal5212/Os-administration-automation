#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="${1:-$HOME/projects/os-admin/docs/sample.log}"

echo "===== LOG MONITOR ====="
echo "File: $LOG_FILE"
echo

if [[ ! -f "$LOG_FILE" ]]; then
    echo "ERROR: Log file not found."
    echo "Usage: $0 /path/to/logfile"
    exit 1
fi

echo "Total log lines: $(wc -l < "$LOG_FILE")"
echo
echo "Matching warnings and errors:"
grep -Ein 'error|failed|warning' "$LOG_FILE" || {
    echo "No matching entries found."
}

echo
echo "Log monitoring completed."
