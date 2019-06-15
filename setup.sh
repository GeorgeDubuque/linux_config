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
wget ~/Pictures/buu.png https://api-da.wixmp.com/_api/download/file?downloadToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImV4cCI6MTU2MDYyNzQwMywiaWF0IjoxNTYwNjI2NzkzLCJqdGkiOiI1ZDA1NDY3MzZjY2Q4Iiwib2JqIjpudWxsLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdLCJwYXlsb2FkIjp7InBhdGgiOiJcL2ZcL2E0NGQwMjA2LTBlNjctNDBjZS05NDIwLWU5YjIxZWQwMjFmYVwvZGJqcnJ2bS0wNjgxYWY1ZC03NTU0LTRjZWEtODYwNS1mY2RlNjI0YjBlOTEucG5nIiwiYXR0YWNobWVudCI6eyJmaWxlbmFtZSI6ImtpZF9idXVfZHJhZ29uX2JhbGxfbWluaW1hbGlzdF9ieV9kYXJrZmF0ZTE3X2RianJydm0ucG5nIn19fQ.X1u7Nhn3lQzd6Je6zWwNK0sF8Dq5pFCrAqhbT4fUsB0

gsettings set org.gnome.desktop.background picture-uri ~/Pictures/buu.png
