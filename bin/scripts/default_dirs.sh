#!/usr/bin/env bash

# Set base directory for new folder structure
BASE_DIR="/doroty/donkey/"

# Loop through standard xdg-user-dirs
for dir_type in DESKTOP DOWNLOAD TEMPLATES PUBLICSHARE DOCUMENTS MUSIC PICTURES VIDEOS; do
	# Get the actual directory path
	target_dir=$(xdg-user-dir "$dir_type")
	# Create equivalent structure in BASE_DIR
	mkdir -p "$BASE_DIR/${target_dir##*/}"
done

echo "Folders created at $BASE_DIR"
