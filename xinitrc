#!/bin/sh

xset r rate 250 60

export $(dbus-launch)

pipewire &
poweralertd &
$HOME/scripts/locker.sh &
picom &
syncthing &
redshift &

#exec dbus-run-session -- i3
#exec dbus-run-session -- herbstluftwm --locked
#exec dbus-run-session -- dk
exec dbus-run-session -- awesome
