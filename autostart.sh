#!/bin/sh

pidof -q picom || { picom & }
pidof -q pipewire || { pipewire & }
pidof -q syncthing || { syncthing & }
pidof -q redshift || { redshift & }

"$HOME"/.config/polybar/launch.sh
wal -i "$HOME/Pictures/Wallpapers/"
. "${HOME}/.cache/wal/colors.sh"
