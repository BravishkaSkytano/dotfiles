#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
pkill -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_top.log /tmp/polybar_bottom.log
polybar top -c "$HOME"/.config/polybar/hack/config.ini 2>&1 | tee -a /tmp/polybar_top.log & disown
polybar bottom -c "$HOME"/.config/polybar/hack/config.ini 2>&1 | tee -a /tmp/polybar_bottom.log & disown

echo "Bars launched..."
