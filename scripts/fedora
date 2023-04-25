#!/bin/bash

read -rp "Update DNF config?: " choice
case $choice in
	[yY]* )
		echo "# Added for speed:" >> /etc/dnf/dnf.conf ;
		echo "fastestmirror=True" >> /etc/dnf/dnf.conf ;
		echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf ;
		echo "defaultyes=True" >> /etc/dnf/dnf.conf ;
		echo "keepcache=True" >> /etc/dnf/dnf.conf ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Change hostname? [y/n]: " choice
case $choice in
	[yY]* )
		read -rp "Enter new hostname: " name ;
		hostnamectl set-hostname $name ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Add RPM Fusion? [y/n]: " choice
case $choice in
	[yY]* )
		dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm ;
	       	dnf groupupdate core ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install media codecs? [y/n]: " choice
case $choice in
	[yY]* ) dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin ;
	       	dnf groupupdate sound-and-video ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install vim? [y/n]: " choice
case $choice in
	[yY]* ) dnf install vim ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install yadm? [y/n]: " choice
case $choice in
	[yY]* )
		dnf config-manager --add-repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_$(rpm -E %fedora)/home:TheLocehiliosan:yadm.repo ;
		dnf install yadm ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install bat? [y/n]: " choice
case $choice in
    	[yY]* ) dnf install bat ;;
    	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install hugo? [y/n]: " choice
case $choice in
	[yY]* ) dnf install hugo ;;
	[nN]* ) echo "Skipping..." ;;
esac

read -rp "Install brave browser? [y/n]: " choice
case $choice in
	[yY]* )
		dnf install dnf-plugins-core ;
		dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ ;
		rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc ;
		dnf install brave-browser ;;
	[nN]* ) echo "Skipping..." ;;
esac

echo "Done installing packages."
echo "Setup successful."
echo "Have fun with your new system!"
