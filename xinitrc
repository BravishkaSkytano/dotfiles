#!/bin/sh

xset r rate 250 60
xbacklight -set 10
xscreensaver &
#xautolock -time 10 -locker xlock matrix

# Window Manager / Compositor
#exec dbus-run-session -- dk
