#!/bin/bash
#   ____ _                              _____ _                          
#  / ___| |__   __ _ _ __   __ _  ___  |_   _| |__   ___ _ __ ___   ___  
# | |   | '_ \ / _` | '_ \ / _` |/ _ \   | | | '_ \ / _ \ '_ ` _ \ / _ \ 
# | |___| | | | (_| | | | | (_| |  __/   | | | | | |  __/ | | | | |  __/ 
#  \____|_| |_|\__,_|_| |_|\__, |\___|   |_| |_| |_|\___|_| |_| |_|\___| 
#                          |___/                                         
#  
# by Stephan Raabe (2023) 
# edited by Yoela O. (2024)
# ----------------------------------------------------- 

# Main wallpaper directory
wal_dir="$HOME/Pictures/wallpapers"

# Recursively check directory for pictures in nested folders
wal_dir=$(find "$wal_dir" |shuf -n 1)

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
blurred="$HOME/.cache/blurred_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f "$cache_file" ]; then
    touch "$cache_file"
    echo "$wal_dir/default.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f "$rasi_file" ]; then
    touch "$rasi_file"
    echo "* { current-image: url(\"$wal_dir/default.jpg\", height); }" > "$rasi_file"
fi

current_wallpaper=$(cat "$cache_file")

case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        if [ -f "$cache_file" ]; then
            wal -q -i "$current_wallpaper"
        else
            wal -q -i "$wal_dir"
        fi
    ;;

    # Select wallpaper with rofi
    "select")
        selected=$( find "$wal_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read -r rfile
        do
            echo -en "$rfile\x00icon\x1f$wal_dir/${rfile}\n"
        done | rofi -dmenu -replace -l 6 -config ~/rofi/config-wallpaper.rasi)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i "$wal_dir"/"$selected"
    ;;

    # Randomly select wallpaper 
    *)
        wal -q -i "$wal_dir"
    ;;

esac

# ----------------------------------------------------- 
# Reload qtile to color bar
# ----------------------------------------------------- 
qtile cmd-obj -o cmd -f reload_config

# ----------------------------------------------------- 
# Get new theme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
echo "Wallpaper: $wallpaper"
newwall=$(echo "$wallpaper" | sed "s|$wal_dir/||g")

# ----------------------------------------------------- 
# Created blurred wallpaper
# ----------------------------------------------------- 
magick "$wallpaper" -resize 50% "$blurred"
echo ":: Resized to 50%"
magick "$blurred" -blur 50x30 "$blurred"
echo ":: Blurred"
# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$blurred\", height); }" > "$rasi_file"

sleep 1

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
notify-send "Colors and Wallpaper updated" "with image $newwall"
echo "Done."
