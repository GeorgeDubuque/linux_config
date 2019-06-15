#!/bin/sh
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
#Install python3.7
prog="Python3.7"
sudo apt-get install python3.7
if [ $? != 0 ]
then
	echo "${RED}${prog} could not be installed!${NC}"
	exit 1
else
	echo "${GREEN}${prog} installed!${NC}"
fi

#Install python2
prog="Python2.7"
sudo apt-get install python
if [ $? != 0 ]
then
	echo "${RED}${prog} could not be installed!${NC}"
	exit 1
else
	echo "${GREEN}${prog} installed!${NC}"
fi

#Install zsh
prog="Zsh"
sudo apt-get install zsh
if [ $? != 0 ]
then
	echo "${RED}${prog} could not be installed!${NC}"
	exit 1
else
	echo "${GREEN}${prog} installed!${NC}"
fi

#Setup oh-my-zsh
prog="oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $? != 0 ]
then
	echo "${RED}${prog} could not be installed or is already installed.${NC}"
else
	echo "${GREEN}${prog} installed!${NC}"
fi

cp -f ./.bashrc ~/.bashrc
cp -f ./.zshrc ~/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -f ./.vimrc ~/.vimrc
