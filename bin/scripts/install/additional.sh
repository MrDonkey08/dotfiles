#!/usr/bin/env bash

sudo pacman -Syu

# Android

sudo pacman -S scrcpy

# Browsers

yay -S brave-bin
sudo pacman -S firefox
sudo pacman -S lynx
sudo pacman -S torbrowser-launcher

# Cibersecurity
sudo pacman -S cupp
sudo pacman -S holehe
sudo pacman -S sherlock

# Cleaners

sudo pacman -S bleachbit
sudo pacman -S paccache

# Converters

sudo pacman -S pandoc-cli
sudo pacman -S txt2tags
sudo pacman -S catdoc
sudo pacman -S md2pdf

# Compressors

sudo pacman -S imagemagick
sudo pacman -S ps2pdf
sudo pacman -S ghostscript

# Diagrams

sudo pacman -S drawio-desktop
sudo pacman -S mermaid-cli

# Network

sudo pacman -S wireshark-cli

# Math

sudo pacman -S bc
sudo pacman -S speedcrunch
sudo pacman -S geogebra

# Metadata Tools

sudo pacman -S perl-image-exiftool
# https://bbs.archlinux.org/viewtopic.php?id=134680
#sudo ln /usr/bin/vendor_perl/exiftool /usr/bin/exiftool

# Messengers

sudo pacman -S discord signal-desktop telegram-desktop

# Media

sudo pacman -S spotify-launcher
sudo pacman -S strawberry
sudo pacman -S vlc
sudo pacman -S obs-studio
sudo pacman -S flameshot
#sudo pacman -S nvidia-settings
sudo pacman -S thunar gvfs

## Media Edition

sudo pacman -S blender
sudo pacman -S kdenlive
sudo pacman -S gimp
sudo pacman -S tenacity

# Meetins

paru -S webex-bin

# Security

sudo pacman -S keepassxc
#sudo pacman -S ufw
paru -S scrub
sudo pacman -S virustotal

# Privacy

sudo pacman -S veracrypt

## VPN

sudo pacman -S openvpn
sudo pacman -S torctl

# Utility

sudo pacman -S at
sudo pacman -S fd
sudo pacman -S htop
sudo pacman -S iostat
sudo pacman -S openssl
sudo pacman -S rclone
sudo pacman -S gparted
sudo pacman -S qrtool
sudo pacman -S screenkey
sudo pacman -S sysstat
sudo pacman -S xclip
sudo pacman -S timeshift
yay -S woeusb-ng

sudo pacman -S mdcat bat lsd
sudo pacman -S locate
sudo pacman -S fzf

## Extra

rsudo pacman -S neofetch
sudo pacman -S fastfetch
sudo pacman -S lolcat cowsay

# Windows Support

sudo pacman -S wine
