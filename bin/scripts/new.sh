#!/usr/bin/env bash

# Move to the user's home directory
cd ~ || exit

# Create a "new" folder if it doesn't exist
mkdir -p new

# List of standard directories to move
for dir in DOWNLOAD DOCUMENTS VIDEOS PICTURES MUSIC; do
	# Get the actual directory path using xdg-user-dir
	folder=$(xdg-user-dir "$dir")

	# Check if the directory exists and is not already inside "new"
	if [ -d "$folder" ] && [ "$folder" != "$HOME/new" ]; then
		mv "$folder" ~/new/
	fi
done

echo "Folders moved to ~/new."
