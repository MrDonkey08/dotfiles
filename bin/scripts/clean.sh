#!/usr/bin/env bash

# Clean pacman cache
sudo pacman -Scc

# Clean package cache
sudo paccache -r

# Delete temporary files and logs using the clean option in journalctl:
sudo journalctl --vacuum-size=100M

# Removes all generated artifacts from all Cargo projects on ~
if command -v cargo clean-all > /dev/null 2>&1; then
	cargo clean-all -y ~
elif command -v cargo > /dev/null 2>&1; then
	find ~ -type f -name 'Cargo.toml' -exec cargo clean {} \;
fi

# Removes interactively all log files that are either empty or larger than 2 MB
# and haven't been modified in at least 30 days
sudo find /var/log -type f -empty -or -size +2M -mtime +30 -exec rm {} \;

# find ~ -type f -empty

# Clean the tmp directory
sudo rm -rf /tmp/*

# Clean the XDG user directories
sudo rm -rf ~/.cache/*
sudo rm -rf ~/.local/share/Trash/*

# Remove old versions of installed packages using paccache:
sudo paccache -r

# Remove orphananed packages
sudo pacman -Qdtq | sudo pacman -Rns -

# Clean AUR cache
yay -Scc
paru -Scc
