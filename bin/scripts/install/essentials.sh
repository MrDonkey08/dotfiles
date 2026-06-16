#!/usr/bin/env bash

sudo pacman -Syu --needed --noconfirm

# General

## Linux
sudo pacman -S --needed --noconfirm \
	linux-lts \
	linux-lts-headers

## Pacman
sudo pacman -S --needed --noconfirm \
	pacman-contrib

## Man pages
# https://wiki.archlinux.org/title/Man_page
sudo pacman -S --needed --noconfirm \
	man-pages \
	man-pages-es \
	mandoc

## Xdg
sudo pacman -S --needed --noconfirm \
	xdg-user-dirs \
	xdg-utils

# sudo pacman -S --needed --noconfirm \
# 	 dkms \
# 	 jshon expac acpid avahi  \
#
# sudo systemctl enable acpid avahi-daemon systemd-timesyncd

## Android Support

# To be able to access to android files
sudo pacman -S --needed --noconfirm \
	android-file-transfer

## Android Debug Bridge

# sudo pacman -S --needed --noconfirm \
# 	android-tools \
# 	android-udev
#
# usermod -aG adbusers "$USER"

# Drivers

## Audio

sudo pacman -S --needed --noconfirm \
	flac

### FulseAudio

sudo pacman -S --needed --noconfirm \
	alsa-utils \
	pulseaudio-alsa \
	pulseaudio-equalizer \
	pulseaudio-jack

# Fix muting some media players
# PulseAudio by default might mute media applications when entering a voice
# call. To disable this:
mkdir -p /etc/pulse/default.pa.d
echo "unload-module module-role-cork" | sudo tee /etc/pulse/default.pa.d/no-cork.pa

### PipeWire

# sudo pacman -S --needed --noconfirm \
# 	alsa-utils \
# 	pipewire \
# 	pipewire-pulse \
# 	pipewire-jack \
# 	wireplumber

### Control App

# For Qt based desktops (e.g. KDE Plasma or LXQt)
# sudo pacman -S --needed --noconfirm \
#	 pavucontrol-qt \
# For GTK based desktop (another desktop environment)
sudo pacman -S --needed --noconfirm \
	pavucontrol

## CPU

# To install microcode support
#sudo pacman -S --needed --noconfirm \
#	 amd-ucode \
sudo pacman -S --needed --noconfirm \
	intel-ucode

## Input

sudo pacman -S --needed --noconfirm \
	xf86-input-synaptics \
	xf86-input-libinput \
	xf86-input-evdev

sudo pacman -S --needed --noconfirm \
	libinput

# Only if you use a VM
# sudo pacman -S --needed --noconfirm \
#	 xf86-input-vmmouse \

## Video

### AMD
# sudo pacman -S --needed --noconfirm \
# 	 libva-mesa-driver \
# 	 lib32-libva-mesa-driver \
# 	 mesa-vdpau lib32-mesa-vdpau \
# 	 libva-vdpau-driver \
# 	 lib32-libva-vdpau-driver \
# 	 vulkan-radeon \
# 	 lib32-vulkan-radeon \

### Intel
sudo pacman -S --needed --noconfirm \
	vulkan-intel

### Nvidia
# sudo pacman -S --needed --noconfirm \
# 	nvidia \
# 	nvidia-utils \
# 	lib32-nvidia-utils \
# 	libvdpau \
# 	lib32-libvdpau \

### Mesa

sudo pacman -S --needed --noconfirm \
	mesa-utils

# Compatible with all GPUs
# Comment if you choose to install another driver
# sudo pacman -S --needed --noconfirm \
# 	lib32-mesa

### Vulkan

sudo pacman -S --needed --noconfirm \
	vulkan-tools

# Useful for all GPUs
sudo pacman -S --needed --noconfirm \
	vulkan-icd-loader \
	lib32-vulkan-icd-loader

# Networks

sudo pacman -S --needed --noconfirm \
	net-tools \
	networkmanager \
	networkmanager-openvpn \
	networkmanager-pptp \
	networkmanager-vpnc

sudo systemctl enable NetworkManager

# Network Manager GUI connection editor and widgets
sudo pacman -S --needed --noconfirm \
	nm-connection-editor

## Bluetooth

sudo pacman -S --needed --noconfirm \
	bluez \
	bluez-utils

sudo systemctl enable bluetooth

# Bluetooth GUI Manager
sudo pacman -S --needed --noconfirm \
	blueman

# only if you installed PulseAudio:
sudo pacman -S --needed --noconfirm \
	pulseaudio-bluetooth

## Wi-Fi

sudo pacman -S --needed --noconfirm \
	wireless_tools \
	wpa_supplicant

## Peripherals

# Printer

# sudo pacman -S --needed --noconfirm \
# 	system-config-printer \
# 	foomatic-db \
# 	foomatic-db-engine \
# 	gutenprint \
# 	gsfonts \
# 	cups \
# 	cups-pdf \
# 	cups-filters \
# 	sane \

# sudo systemctl enable cups.service saned.socket

# Qt Scan Application: Use this if you use KDE Plasma or LXQt
#	 skanlite \

# GTK Scan Application: Use this if you use another desktop environment
# sudo pacman -S --needed --noconfirm \
#	 simple-scan \

# HP Printer Support
# sudo pacman -S --needed --noconfirm \
#	 hplip \

## SSD

sudo systemctl enable fstrim.timer

# Terminal and Shells

## Terminals

# Alacritty Dependencies
sudo pacman -S --needed --noconfirm \
	cmake \
	freetype2 \
	fontconfig \
	pkg-config \
	make \
	libxcb \
	libxkbcommon \
	python \
	scdoc
# Alacritty Installation Guide:
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md

# Kitty
sudo pacman -S --needed --noconfirm \
	kitty

## Shells

### Fish
# sudo pacman -S --needed --noconfirm \
# 	 fish \
# Uncomment to make Fish your default Shell
#chsh -s /usr/bin/fish "$USER"

### Zsh
sudo pacman -S --needed --noconfirm \
	zsh

# Uncomment to make Zsh your default Shell
chsh -s /usr/bin/zsh "$USER"

# Zsh Extensions
sudo pacman -S --needed --noconfirm \
	git-zsh-completion \
	zsh-autocomplete \
	zsh-autosuggestions \
	zsh-completions \
	zsh-syntax-highlighting

### Powershell
# paru -S --needed --noconfirm \
# 	powershell-bin

# Utility

sudo pacman -S --needed --noconfirm \
	curl \
	wget \
	tree

## Archiver

sudo pacman -S --needed --noconfirm \
	tar unarchiver unace \
	rsync

## Compressor

sudo pacman -S --needed --noconfirm \
	gzip bzip2 xz zstd lrzip lzop compress lz4 lzip \
	pigz pbzip2 \
	p7zip unrar zip unzip \
	gzip pbzip2 bzip3

paru -S --needed --noconfirm \
	plzip

## File Systems

sudo pacman -S --needed --noconfirm \
	nfs-utils \
	cifs-utils \
	ntfs-3g \
	exfat-utils \
	gvfs \
	udisks2

## Fonts

sudo pacman -S --needed --noconfirm \
	noto-fonts \
	ttf-font-awesome \
	ttf-liberation \
	ttf-nerd-fonts-symbols-mono

paru -S --needed --noconfirm \
	ttf-font-awesome-4

sudo pacman -S --needed --noconfirm \
	ttf-material-design-icons \
	gnu-free-fonts

## Microsoft_fonts
# https://wiki.archlinux.org/title/Microsoft_fonts
sudo ln -s /windows/Windows/Fonts /usr/local/share/fonts/WindowsFonts

## Legacy Microsoft Fonts
# paru  -S --needed --noconfirm \
# 	ttf-ms-fonts \
# 	ttf-vista-fonts

### Emoji Support
sudo pacman -S --needed --noconfirm \
	noto-fonts-emoji \
	ttf-joypixels

## Git
# Git LFS for binaries file managment support. Pretty useful
sudo pacman -S --needed --noconfirm \
	git \
	git-lfs

# Uncategorized

## Reflector
sudo pacman -S --needed --noconfirm \
	reflector
#reflector -c Mx -a 6 --sort rate --save /etc/pacman.d/mirrorlist
#reflector --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
