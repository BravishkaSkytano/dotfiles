#!/bin/sh

xset r rate 250 60
#xbacklight -set 10
xscreensaver &
#xautolock -time 10 -locker xlock matrix

export PATH=$PATH:$HOME/.local/bin:/opt
export BROWSER="vivaldi-stable"
export EDITOR="micro"
export VISUAL="micro"
#export $(dbus-launch)

export __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep vendor

# Window Manager / Compositor
#exec dbus-run-session -- dk
