#!/bin/bash

# Author: Aleksandar Stojanoski

echo "=================================="
echo "Synchronizing repository databases"
echo "=================================="
sudo pacman -Syy

echo "=================================="
echo "Installing xcursor-breeze"
echo "=================================="
sudo pacman -S --needed xcursor-breeze
