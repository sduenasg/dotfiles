#!/bin/bash
echo -e "\n---- using apt ---"
packages=(figlet cowsay powerline powerline-fonts python3 python3-pip fortune)

for pkg in ${packages[@]}
do
	echo -e "\nInstalling \033[31m$pkg\033[0m from repo:"
	sudo apt install $pkg
done

