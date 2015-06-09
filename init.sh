#!/bin/bash

# Install fontconfig
echo "Install fontconfig"
sudo apt-get install fontconfig -y &>/dev/null

# Git
echo "Install git"
sudo apt-get install git -y &>/dev/null

# Zsh
echo "Install zsh"
sudo apt-get install zsh -y &>/dev/null
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - &>/dev/null | sh &>/dev/null
chsh -s /bin/zsh `whoami`

# GVim
echo "Install GVim"
sudo apt-get install vim-gtk -y &>/dev/null
sudo apt-get install exuberant-ctags -y &>/dev/null

# Python pip
echo "Install pip"
sudo apt-get install python-dev python3-dev -y &>/dev/null
sudo apt-get install python-pip python3-pip -y &>/dev/null
sudo pip install --upgrade pip &>/dev/null
sudo pip3 install --upgrade pip &>/dev/null

# Virtualenv and Virtualenvwrapper
echo "Install virtualenv and virtualenvwrapper"
sudo pip install virtualenv virtualenvwrapper &>/dev/null
sudo pip3 install virtualenv virtualenvwrapper &>/dev/null

# Powerline
echo "Install powerline"
sudo apt-get install socat build-essential cmake autogen libtool autotools-dev automake -y &>/dev/null
sudo pip install psutil mercurial bzr pyuv i3-py &>/dev/null
wget https://github.com/libgit2/libgit2/archive/v0.22.0.tar.gz &>/dev/null
tar xzf v0.22.0.tar.gz &>/dev/null
cd libgit2-0.22.0/ &>/dev/null
cmake . &>/dev/null
make &>/dev/null
sudo make install &>/dev/null
cd .. &>/dev/null
sudo rm -r libgit2-0.22.0 v0.22.0.tar.gz &>/dev/null
sudo pip install pygit2 &>/dev/null
sudo pip install powerline-status &>/dev/null

