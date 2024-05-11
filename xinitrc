#!/bin/sh

xset r rate 250 60

#exec dbus-run-session -- i3
exec dbus-run-session -- herbstluftwm --locked
#exec dbus-run-session -- dk
