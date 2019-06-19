#!/bin/sh
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

installation_message(){
		if [ $? != 0 ]
		then
			echo "${RED}${prog} could not be installed!${NC}"
			exit 1
		else
			echo "${GREEN}${prog} installed!${NC}"
		fi

}

#Install python3.7
prog="Python3.7"
sudo apt-get install python3.7
installation_message

#Install python2
prog="Python2.7"
sudo apt-get install python
installation_message

#Install zsh
prog="Zsh"
sudo apt-get install zsh
installation_message

#Install oh-my-zsh
prog="oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
installation_message

#Setup shell
cp -f ./.bashrc ~/.bashrc
cp -f ./.zshrc ~/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -f ./.vimrc ~/.vimrc
source ~/.bashrc
source ~/.zshrc

#Load shell profile
dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < ./shell-theme.dconf

#Download and set background
mv ./buu.png ~/Pictures
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/buu.png
