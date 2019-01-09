#!/bin/bash

haveProg(){
	[-x "$(which $1)"]
}

install_apt(){
	sudo apt-get install $1
}

install_pacman(){
	sudo pacman -S $1
}

if haveProg apt-get ; then install_apt zsh
elif haveProg pacman ; then install_pacman zsh
else
	echo 'No supported package manager found'
	exit 2
fi

chsh -s $(which zsh)

packages=(git figlet cowsay powerline powerline-fonts python3 python3-pip fortune imagemagick)

for pkg in ${packages[@]}
do
	echo -e "\nInstalling \033[31m$pkg\033[0m from repo:"
	if haveProg apt-get ; then install_apt $pkg
	elif haveProg pacman ; then install_pacman $pkg
	else
		echo 'no supported package manager found'
		exit 2
	fi
done

sudo pip3 install pywal
