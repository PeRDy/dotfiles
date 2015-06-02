#!/bin/bash

# Git
sudo apt-get install git -y

# GVim
sudo apt-get install vim-gtk -y

# Python pip
sudo apt-get install python-pip python3-pip -y
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip

# Virtualenv and Virtualenvwrapper
sudo pip install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper

# Powerline
sudo apt-get install socat build-essential cmake autogen libtool autotools-dev automake -y
sudo pip install psutil mercurial bzr pyuv i3-py
wget https://github.com/libgit2/libgit2/archive/v0.22.0.tar.gz
tar xzf v0.22.0.tar.gz
cd libgit2-0.22.0/
cmake .
make
sudo make install
cd ..
sudo rm -r libgit2-0.22.0 v0.22.0.tar.gz
sudo pip install pygit2
sudo pip install powerline-status

