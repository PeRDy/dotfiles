#!/bin/bash

# Install dependencies 
echo "Install dependencies"
sudo yaourt -Sy --noconfirm zsh fontconfig python-pip gvim

# Change shell to zsh
echo "Change shell to zsh"
chsh -s /bin/zsh `whoami`

# Virtualenv and Virtualenvwrapper
echo "Install virtualenv and virtualenvwrapper"
sudo pip install virtualenv virtualenvwrapper

# Themes
echo "Install Themes"
sudo yaourt -S install numix-circle-icon-theme-git numix-themes-electric
