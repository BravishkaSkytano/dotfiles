export PATH=$PATH:$HOME/.local/bin:/opt
export BROWSER="vivaldi-stable"
export EDITOR="micro"
export VISUAL="micro"
#export $(dbus-launch)

export __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep vendor

[[ -e ~/.nix-profile/etc/profil.d/nix.sh ]] && . ~/.nix-profile/etc/profile.d/nix.sh
