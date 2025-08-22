#!/usr/bin/env bash

# Clean pacman cache
sudo pacman -Scc

# Clean package cache
sudo paccache -r

# Delete temporary files and logs using the clean option in journalctl:
sudo journalctl --vacuum-size=100M

# Clean the tmp directory
sudo rm -rf /tmp/*

# Clean the XDG user directories
# rm -rf ~/.cache/*
rm -rf ~/.local/share/Trash/*

# Remove old versions of installed packages using paccache:
sudo paccache -r

# Remove orphananed packages
sudo pacman -Qdtq | sudo pacman -Rns -

# Clean AUR cache
yay -Scc
paru -Scc
