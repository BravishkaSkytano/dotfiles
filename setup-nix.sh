#!/bin/bash

read -p "Install Nix package manager?. Yes(y) / No(n) / Cancel(c):- " choice
if [ "$choice" = "y" ]; then
	echo "Installing Nix..."
	sh <(curl -L https://nixos.org/nix/install)
	. ~/.nix-profile/etc/profile.d/nix.sh
elif [ "$choice" = "n" ];then
	echo "Skipping..."
elif [ "$choice" = "c" ];then
	echo "Aborting"
	exit
fi

echo "To update Nix run 'nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert'"
echo "You can also just run 'nix-channel --update'"

# install packages
echo "Installing Nix packages..."

read -p "Install Git? Yes(y) / No (n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.git ;;
	[nN]* ) break ;;
esac

read -p "Install Neofetch Yes(y) / No (n):- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.neofetch ;;
    [nN]* ) break ;;
esac

read -p "Install Stow? Yes(y) / No (n):- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.stow ;;
    [nN]* ) break ;;
esac

read -p "Install bat? Yes(y) / No (n):- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.bat ;;
    [nN]* ) break ;;
esac

read -p "Install fzf Yes(y) / No (n):- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.fzf ;;
    [nN]* ) break ;;
esac

read -p "Install Go? Yes(y) / No (n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.go ;;
	[nN]* ) break ;;
esac

read -p "Install Hugo? Yes(y) / No(n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.hugo ;;
	[nN]* ) break ;;
esac

echo "Done installing packages."

# Configuring dotfiles
echo "Moving on to dotfiles..."
read -p "Run stow? Yes(y) / No(n):- " choice
if [ "$choice" = "y" ]; then
	echo "Running stow..."
	cd ~/.dotfiles
	for d in $(ls -d */ | cut -f1 -d '/');
	do
		( stow "$d" )
	done
	echo "Done."
elif [ "$choice" = "n" ];then
	echo "Skipping..."
fi

echo "Setup successful."
echo "Have fun with your new system!"

