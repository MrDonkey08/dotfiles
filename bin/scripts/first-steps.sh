#!/usr/bin/env bash

sudo pacman -S linux linux-firmware networkmanager grub wpa_supplicant base base-devel

genfstab -U /mnt >> /etc/ftab
