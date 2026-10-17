#!/usr/bin/env bash
set -euo pipefail

PROJECT="$HOME/projects/os-admin"

echo "===== PERMISSIONS AUDIT ====="
echo "Current user: $(whoami)"
echo "Project directory: $PROJECT"
echo

echo "Directory permissions:"
ls -ld "$PROJECT" "$PROJECT/linux" "$PROJECT/linux/users"

echo
echo "Script permissions:"
find "$PROJECT" -type f -name "*.sh" -exec ls -l {} \;

echo
echo "Permissions audit completed."
