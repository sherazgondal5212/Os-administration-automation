#!/usr/bin/env bash
set -u

echo "===== PROCESS & SERVICE MONITOR ====="
echo "Date: $(date)"
echo

echo "Top running processes:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10

echo
echo "System service manager:"
if command -v systemctl >/dev/null 2>&1; then
    systemctl is-system-running 2>&1 || true
    echo
    echo "Failed services:"
    systemctl --failed --no-pager 2>&1 || true
else
    echo "systemctl is not available in this environment."
fi

echo
echo "Process and service check completed."
