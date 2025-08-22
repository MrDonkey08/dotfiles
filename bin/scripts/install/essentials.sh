#!/usr/bin/env bash

sudo pacman -Syu

# General

sudo pacman -S pacman-contrib
sudo pacman -S man-pages
sudo pacman -S mandoc

sudo pacman -S linux-headers dkms
sudo pacman -S jshon expac git wget acpid avahi net-tools xdg-user-dirs
systemctl enable acpid avahi-daemon systemd-timesyncd

## Android Support

# To be able to access to android files
sudo pacman -S android-file-transfer

## Android Debug Bridge

#sudo pacman -S android-tools android-udev
#usermod -aG adbusers donkey

# Drivers

## Audio

sudo pacman -S flac

### FulseAudio

sudo pacman -S alsa-utils pulseaudio-alsa pulseaudio-equalizer

# Fix muting some media players
# PulseAudio by default might mute media applications when entering a voice
# call. To disable this:
mkdir -p /etc/pulse/default.pa.d
echo "unload-module module-role-cork" > /etc/pulse/default.pa.d/no-cork.pa

### PipeWire

#sudo pacman -S alsa-utils pipewire pipewire-pulse pipewire-jack wireplumber

### Control App

# For Qt based desktops (e.g. KDE Plasma or LXQt)
#sudo pacman -S pavucontrol-qt
# For GTK based desktop (another desktop environment)
sudo pacman -S pavucontrol

## CPU

# To install microcode support
#sudo pacman -S amd-ucode
sudo pacman -S intel-ucode

## Input

# sudo pacman -S xf86-input-synaptics xf86-input-libinput xf86-input-evdev

# Only if you use a VM
#sudo pacman -S xf86-input-vmmouse

## Video

### AMD
#sudo pacman -S libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau libva-vdpau-driver lib32-libva-vdpau-driver vulkan-radeon lib32-vulkan-radeon

### Intel
sudo pacman -S vulkan-intel

### Nvidia
#sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils libvdpau lib32-libvdpau

### Mesa

# Compatible with all GPUs
# Comment if you choose to install another driver
sudo pacman -S lib32-mesa

### Vulkan

# Useful for all GPUs
sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader

# Networks

sudo pacman -S net-tools
sudo pacman -S networkmanager networkmanager-openvpn networkmanager-pptp networkmanager-vpnc
systemctl enable NetworkManager

## Bluetooth

sudo pacman -S bluez bluez-utils
systemctl enable bluetooth

# Bluetooth GUI Manager
sudo pacman -S blueman

# only if you installed PulseAudio:
sudo pacman -S pulseaudio-bluetooth

## Wi-Fi

sudo pacman -S wireless_tools wpa_supplicant ifplugd dialog

## Peripherals

# Printer

#sudo pacman -S system-config-printer foomatic-db foomatic-db-engine gutenprint gsfonts cups cups-pdf cups-filters sane
#systemctl enable cups.service saned.socket

# Qt Scan Application: Use this if you use KDE Plasma or LXQt
#sudo pacman -S skanlite

# GTK Scan Application: Use this if you use another desktop environment
#sudo pacman -S simple-scan

# HP Printer Support
#sudo pacman -S hplip

## SSD

systemctl enable fstrim.timer

# Terminal and Shells

## Terminals

# Alacritty Dependencies
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
sudo pacman -S scdoc
# To install Alacritty Installation Guide: https://github.com/alacritty/alacritty/blob/master/INSTALL.md

# Kitty
sudo pacman -S kitty

## Shells

### Fish
#sudo pacman -S fish
# Uncomment to make Fish your default Shell
#chsh -s /usr/bin/fish donkey

### Zsh
sudo pacman -S zsh zsh-completions

# Uncomment to make Zsh your default Shell
#chsh -s /usr/bin/zsh donkey

# Zsh Extensions
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions

### Powershell
# paru -S powershell-bin

# Utility

sudo pacman -S curl wget
sudo pacman -S tree

## Archiver

sudo pacman -S p7zip unrar zip unzip
sudo pacman -S tar unarchiver unace xz rsync
sudo pacman -S gzip pbzip2 bzip3

## File Systems

sudo pacman -S nfs-utils cifs-utils ntfs-3g exfat-utils gvfs udisks2

## Fonts

sudo pacman -S noto-fonts
sudo pacman -S ttf-font-awesome
sudo pacman -S ttf-liberation
sudo pacman -S ttf-nerd-fonts-symbols-mono
paru -S ttf-font-awesome-4 ttf-material-design-icons
sudo pacman -S gnu-free-fonts

## Microsoft_fonts
# https://wiki.archlinux.org/title/Microsoft_fonts
sudo ln -s /windows/Windows/Fonts /usr/local/share/fonts/WindowsFonts

## Legacy Microsoft Fonts
yay -S ttf-ms-fonts
paru -S ttf-vista-fonts

### Emoji Support
sudo pacman -S noto-fonts-emoji
sudo pacman -S ttf-joypixels

## Git
# Git LFS for binaries file managment support. Pretty useful
sudo pacman -S git git-lfs

# Uncategorized

## Reflector
sudo pacman -S reflector
#reflector -c Mx -a 6 --sort rate --save /etc/pacman.d/mirrorlist
#reflector --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
