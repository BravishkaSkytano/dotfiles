#!/bin/bash

# Make this file executable with chmod u+x install.sh

# Update system
sudo apt update; sudo apt upgrade

# Install essentials
sudo apt install vim git stow python3 python-pip3
pip3 install proselint

# Clone git repositories
cd ~
if [ ! -d '~/.dotfiles' ]; then
    echo 'Cloning dotfiles'
    git clone https://github.com/BravishkaSkytano/.dotfiles
fi
git clone https://github.com/BravishkaSkytano/VimWiki ~/Documents/VimWiki
git clone https://github.com/BravishkaSkytano/wiki ~/Documents/VimWiki_html

# Symlink configuration
cd ~/.dotfiles
stow git
stow bash
stow vim

