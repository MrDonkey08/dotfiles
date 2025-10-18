#!/usr/bin/env bash

sudo pacman -Syu

# Android

sudo pacman -S --needed --noconfirm \
	scrcpy

# Benchmarks

paru -S --needed --noconfirm \
	hardinfo2

# Browsers

yay -S --needed --noconfirm brave-bin
sudo pacman -S --needed --noconfirm \
	firefox \
	lynx \
	torbrowser-launcher

# Cibersecurity
sudo pacman -S --needed --noconfirm \
	cupp \
	holehe \
	sherlock

# Cleaners

sudo pacman -S --needed --noconfirm \
	bleachbit

# Converters

sudo pacman -S --needed --noconfirm \
	pandoc-cli \
	txt2tags \
	catdoc

paru -S --needed --noconfirm \
	md2pdf

# Compressors

sudo pacman -S --needed --noconfirm \
	imagemagick \
	ghostscript

# Diagrams

sudo pacman -S --needed --noconfirm \
	drawio-desktop \
	mermaid-cli

# Helpers

# sudo pacman -S --needed --noconfirm \
# 	tldr

# `tldr` alternative written in Rust
sudo pacman -S --needed --noconfirm \
	tealdeer

# Network

sudo pacman -S --needed --noconfirm \
	wireshark-cli

# Math

sudo pacman -S --needed --noconfirm \
	bc \
	speedcrunch
# 	 geogebra \

# Metadata Tools

sudo pacman -S --needed --noconfirm \
	perl-image-exiftool
# https://bbs.archlinux.org/viewtopic.php?id=134680
#sudo ln /usr/bin/vendor_perl/exiftool /usr/bin/exiftool

# Messengers

sudo pacman -S --needed --noconfirm \
	discord \
	signal-desktop \
	telegram-desktop

# Media

sudo pacman -S --needed --noconfirm \
	spotify-launcher \
	strawberry \
	obs-studio \
	flameshot

sudo pacman -S --needed --noconfirm \
	vlc \
	vlc-plugin-base \
	vlc-plugin-x264 \
	vlc-plugin-x265 \
	vlc-plugin-ffmpeg

# thunar gvfs #	 nvidia-settings \

## Media Edition

sudo pacman -S --needed --noconfirm \
	gimp \
	tenacity
# 	blender \
# 	kdenlive

# Meetings

# paru -S --needed --noconfirm webex-bin

# Security

sudo pacman -S --needed --noconfirm \
	keepassxc \
	virustotal
#	 ufw \

paru -S --needed --noconfirm \
	scrub

# Privacy

sudo pacman -S --needed --noconfirm \
	veracrypt

## VPN

sudo pacman -S --needed --noconfirm \
	openvpn \
	torctl

# Utility

sudo pacman -S --needed --noconfirm \
	at \
	fd \
	htop \
	openssl \
	rclone \
	gparted \
	qrtool \
	screenkey \
	stow \
	sysstat \
	xclip \
	timeshift

sudo pacman -S --needed --noconfirm \
	progress \
	hdparm

yay -S --needed --noconfirm \
	woeusb-ng

sudo pacman -S --needed --noconfirm \
	bat \
	lsd \
	mdcat

sudo pacman -S --needed --noconfirm \
	locate \
	fzf

## Extra

sudo pacman -S --needed --noconfirm \
	fastfetch \
	lolcat \
	cowsay

# Windows Support

sudo pacman -S --needed --noconfirm \
	wine \
	vkd3d \
	wine-gecko \
	wine-mono
