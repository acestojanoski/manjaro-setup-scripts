#!/bin/bash

# Author: Aleksandar Stojanoski

# don't allow to run the script as root
[ ${EUID} = 0 ] && echo "Error: Don't run the script as root/sudo" && exit 1

VIM_DIRECTORY=${HOME}/.vim;
VIM_CONFIG=${HOME}/.vimrc;

echo "=================================="
echo "Synchronizing repository databases"
echo "=================================="
sudo pacman -Syy

echo "==================================="
echo "Installing vim"
echo "==================================="
sudo pacman -S --needed vim

echo "==================================="
echo "Installing dependencies"
echo "==================================="
sudo pacman -S --needed python curl cmake wget

echo "==================================="
echo "Installing pathogen"
echo "==================================="
[ -d ${VIM_DIRECTORY} ] && sudo rm -rf ${VIM_DIRECTORY}

mkdir -p ${VIM_DIRECTORY}/autoload ${VIM_DIRECTORY}/bundle && \
    curl -LSso ${VIM_DIRECTORY}/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "==================================="
echo "Installing plugins"
echo "==================================="
# install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ${VIM_DIRECTORY}/bundle/nerdtree
# install gruvbox theme
git clone https://github.com/morhetz/gruvbox.git ${VIM_DIRECTORY}/bundle/gruvbox
# install minimalist theme
git clone https://github.com/dikiaap/minimalist ${VIM_DIRECTORY}/bundle/minimalist
# install vim-javascript
git clone https://github.com/pangloss/vim-javascript.git ${VIM_DIRECTORY}/bundle/vim-javascript
# install lightline
git clone https://github.com/itchyny/lightline.vim ${VIM_DIRECTORY}/pack/plugins/start/lightline
# install vim-jsx
git clone https://github.com/mxw/vim-jsx.git ${VIM_DIRECTORY}/bundle/vim-jsx
# install ale
git clone https://github.com/dense-analysis/ale.git ${VIM_DIRECTORY}/bundle/ale
# install YouCompleteMe
git clone --recursive https://github.com/ycm-core/YouCompleteMe.git ${VIM_DIRECTORY}/bundle/YouCompleteMe
python3 ${VIM_DIRECTORY}/bundle/YouCompleteMe/install.py --ts-completer

echo "==================================="
echo "Get config from the repository"
echo "==================================="
[ -f ${VIM_CONFIG} ] && sudo rm ${VIM_CONFIG}
wget https://raw.githubusercontent.com/acestojanoski/config-files/master/linux/home/.vimrc -O ${VIM_CONFIG}
