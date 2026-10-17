#!/usr/bin/env bash
set -u

echo "================================"
echo " SYSTEM HEALTH REPORT"
echo "================================"
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Uptime:"
uptime
echo
echo "CPU Cores: $(nproc)"
echo
echo "Memory Usage:"
free -h
echo
echo "Disk Usage:"
df -h
echo
echo "Health report completed."
