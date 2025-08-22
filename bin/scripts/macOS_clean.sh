#!/usr/bin/env bash

# Safety check - exit on errors and unset variables
set -eo pipefail

# Function to display disk space before and after
display_disk_space()
{
	echo "Current disk space:"
	df -h / | awk 'NR==2 {print $4 " free"}'
}

display_disk_space

# Confirmation prompt (default: No)
read -p "This will delete cached files and temporary data. Continue? [y/N] " -n 1 -r
echo
REPLY="${REPLY:-n}" # Default to 'n' if empty
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi

# --- Cleanup Steps ---

# User cache files
echo "Clearing user cache files..."
rm -rf ~/Library/Caches/* 2> /dev/null || true

# System cache
echo "Clearing system cache..."
sudo rm -rf /Library/Caches/* 2> /dev/null || true

# Old Downloads (>30 days)
DAYS_THRESHOLD=30
read -p "Do you want to delete Downloads older than $DAYS_THRESHOLD days? [y/N] " -n 1 -r
echo
REPLY="${REPLY:-n}" # Default to 'n' if empty
if [[ $REPLY =~ ^[Yy]$ ]]; then
	find ~/Downloads -type f -mtime +$DAYS_THRESHOLD -delete 2> /dev/null || true
fi

# Empty Trash
echo "Emptying Trash..."
rm -rf ~/.Trash/* 2> /dev/null || true

# iOS backups
echo "Removing iOS backups..."
rm -rf ~/Library/Application\ Support/MobileSync/Backup/* 2> /dev/null || true

# Docker cleanup
if command -v docker &> /dev/null; then
	echo "Cleaning Docker..."
	docker system prune -af --volumes 2> /dev/null || true
fi

# Xcode cleanup
echo "Clearing Xcode DerivedData..."
rm -rf ~/Library/Developer/Xcode/DerivedData/* 2> /dev/null || true

# Homebrew cleanup
if command -v brew &> /dev/null; then
	echo "Cleaning Homebrew..."
	brew cleanup -s 2> /dev/null || true
fi

# /tmp Cleanup (default: No)
read -p "WARNING: Clearing /tmp may disrupt apps. Proceed? [y/N] " -n 1 -r
echo
REPLY="${REPLY:-n}"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sudo rm -rf /tmp/* 2> /dev/null || true
fi

# System logs/swapfiles (default: No)
read -p "Delete system logs/swapfiles? (Risky!) [y/N] " -n 1 -r
echo
REPLY="${REPLY:-n}"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sudo rm -rf /private/var/log/asl/*.asl 2> /dev/null || true
	sudo rm -rf /private/var/vm/swapfile* 2> /dev/null || true
fi

# Final disk space
echo "Cleaning complete!"
display_disk_space
