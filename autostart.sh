#!/bin/sh

pidof -q picom || { picom & }
pidof -q pipewire || { pipewire & }
pidof -q xfce4-power-manager || { xfce4-power-manager & }
pidof -q dunst || { dunst & }
pidof -q syncthing || { syncthing & }
pidof -q redshift || { redshift & }

#"$HOME"/scripts/wallpaper.sh init
#wal -i "$HOME/Pictures/Wallpapers/"

wal_dir="$HOME/Pictures/wallpapers"

wal_dir=$(find $wal_dir | shuf -n 1)

wal -i "$wal_dir"

#. "$HOME/.cache/wal/colors.sh"
