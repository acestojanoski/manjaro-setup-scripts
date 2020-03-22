#!/bin/bash

# Author: Aleksandar Stojanoski

# don't allow to run the script as root
[ ${EUID} = 0 ] && echo "Error: Don't run the script as root/sudo" && exit 1

echo "=================================="
echo "Synchronizing repository databases"
echo "=================================="
sudo pacman -Syy

echo "=================================="
echo "Installing core packages"
echo "=================================="
sudo pacman -S --needed vlc libreoffice-still transmission-gtk terminator cmake \
    gimp vim rofi meld chromium neofetch curl wget zip unzip python python-pip yay
