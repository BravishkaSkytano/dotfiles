#!/bin/bash

read -rp "Install Nix package manager?. Yes(y) / No(n) / Cancel(c):- " choice
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

read -rp "Install Git? Yes(y) / No (n):- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.git ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install Neofetch:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.neofetch ;;
    [nN]* ) echo "Skipping..." ;;
esac

read -rp "Install bat?:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.bat ;;
    [nN]* ) echo "Skipping..." ;;
esac

read -rp "Install fzf:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.fzf ;;
    [nN]* ) echo "Skipping..." ;;
esac

read -rp "Install yadm?:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.yadm ;;
    [nN]* ) echo "Skipping" ;;
esac

read -rp "Install Go?:- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.go ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install Hugo?:- " choice
case $choice in
	[yY]* ) nix-env -iA nixpkgs.hugo ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install Libreoffice?:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.libreoffice-fresh ;;
    [nN]* ) echo "Skipping..." ;;
esac

read -rp "Install Telegram Desktop?:- " choice
case $choice in
    [yY]* ) nix-env -iA nixpkgs.tdesktop ;;
    [nN]* ) echo "Skipping..." ;;
esac

echo "Done installing packages."
echo "Setup successful."
echo "Have fun with your new system!"
