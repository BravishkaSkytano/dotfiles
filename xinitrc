#!/bin/sh

xset r rate 250 60
xbacklight -set 10
xscreensaver &
betterlockscreen -u "$(< "$HOME/.cache/wal/wal")" -l

# Window Manager / Compositor
#exec dbus-run-session -- dk
