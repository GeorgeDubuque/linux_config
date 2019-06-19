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

pkg_file="./pkg.list"

while read -r prog
do
	sudo apt-get install $prog
	installation_message
done < "$pkg_file"

#Install oh-my-zsh
prog="oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
