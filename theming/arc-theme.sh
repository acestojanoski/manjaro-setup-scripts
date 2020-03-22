#!/bin/bash

# Author: Aleksandar Stojanoski

echo "=================================="
echo "Synchronizing repository databases"
echo "=================================="
sudo pacman -Syy

echo "=================================="
echo "Installing arc-gtk-theme"
echo "=================================="
sudo pacman -S --needed arc-gtk-theme
