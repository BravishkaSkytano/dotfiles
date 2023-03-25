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

nix-env -iA \
	nixpkgs.git \
	nixpkgs.stow \
	nixpkgs.bat \
	nixpkgs.fzf

read -p "Do you want to install LibreOffice? Yes(y) / No (n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixos.bat ;;
	[nN]* ) echo "Skipping.." ;;
esac

read -p "Do you want to install Go? Yes(y) / No (n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixos.go ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -p "Do you want to install Hugo? Yes(y) / No(n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixos.hugo ;;
	[nN]* ) echo "Skipping..." ;;
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

