export PATH=$PATH:$HOME/.local/bin:/opt
export BROWSER="vivaldi-stable"
export EDITOR="micro"
export VISUAL="micro"
#export $(dbus-launch)

[[ -e ~/.nix-profile/etc/profil.d/nix.sh ]] && . ~/.nix-profile/etc/profile.d/nix.sh
