#!/bin/bash

# Author: Aleksandar Stojanoski

# don't allow to run the script as root
[ ${EUID} = 0 ] && echo "Error: Don't run the script as root/sudo" && exit 1

echo "=================================="
echo "Synchronizing repository databases"
echo "=================================="
sudo pacman -Syy

echo "=================================="
echo "Installing dependencies"
echo "=================================="
sudo pacman -S --needed python python-pip

echo "=================================="
echo "Installing poweline-shell"
echo "=================================="
sudo pip install powerline-shell

echo "=================================="
echo "Updating .bashrc file"
echo "backup will be created in the home directory"
echo "=================================="

cp ~/.bashrc ~/bashrc_backup
echo "" >> ~/.bashrc
echo 'function _update_ps1() {' >> ~/.bashrc
echo '    PS1=$(powerline-shell $?)' >> ~/.bashrc
echo '}' >> ~/.bashrc
echo 'if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then' >> ~/.bashrc
echo '    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"' >> ~/.bashrc
echo 'fi' >> ~/.bashrc

echo "=================================="
echo "Installing fonts"
echo "=================================="
bash fonts.sh
