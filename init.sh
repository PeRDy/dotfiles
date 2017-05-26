#!/bin/bash

# Install fontconfig
echo "Install fontconfig"
sudo apt install fontconfig -y &>/dev/null

# Git
echo "Install git"
sudo apt install git -y &>/dev/null

# Zsh
echo "Install zsh"
sudo apt install zsh -y &>/dev/null
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh `whoami`

# GVim
echo "Install GVim"
sudo apt install xsel ycmd -y &>/dev/null
sudo add-apt-repository ppa:jonathonf/vim -y &>/dev/null
sudo apt update && sudo apt install vim -y &>/dev/null
sudo apt install build-essential cmake npm nodejs -y &>/dev/null
sudo apt install vim-gtk vim-youcompleteme -y &>/dev/null
sudo apt install exuberant-ctags silversearcher-ag -y &>/dev/null
sudo pip install yapf isort jedi -y &>/dev/null

# Python pip
echo "Install pip"
sudo apt install python-dev python3-dev -y &>/dev/null
sudo apt install python-pip python3-pip -y &>/dev/null
sudo pip install --upgrade pip &>/dev/null
sudo pip3 install --upgrade pip &>/dev/null

# Virtualenv and Virtualenvwrapper
echo "Install virtualenv and virtualenvwrapper"
sudo pip2 install virtualenv virtualenvwrapper &>/dev/null
sudo pip3 install virtualenv virtualenvwrapper &>/dev/null

# Themes
echo "Install Themes"
sudo add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:tista/adapta -y
sudo apt update
sudo apt install -y paper-gtk-theme paper-icon-theme paper-cursor-theme numix-gtk-theme numix-icon-theme numix-icon-theme-circle adapta-gtk-theme unity-tweak-tool
