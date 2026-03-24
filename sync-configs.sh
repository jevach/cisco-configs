#!/bin/bash

TFTP_DIR="/private/tftpboot"
GITHUB_DIR="$HOME/Documents/GitHub/cisco-configs"

# Copy all .cfg files from tftpboot to GitHub folder
echo "Copying configs from $TFTP_DIR to $GITHUB_DIR..."
cp "$TFTP_DIR"/*.cfg "$GITHUB_DIR/" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Copy successful."
else
    echo "No .cfg files found or copy failed."
    exit 1
fi

# Git commit and push
cd "$GITHUB_DIR" || exit 1

git add *.cfg
git commit -m "Update Cisco configs - $(date '+%Y-%m-%d %H:%M')"
git push

echo "Done."
