#!/usr/bin/env bash

# Set wallpaper directory
wal_dir="$HOME/Pictures/wallpapers"

# Recursively find wallpapers
wal_dir=$(find $wal_dir | shuf -n 1)

# Set random wallpaper
wal -i "$wal_dir"
