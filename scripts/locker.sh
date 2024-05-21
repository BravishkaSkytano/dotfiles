#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
export BRIGHTNESS="$(xbacklight -get)"

# Run xidlehook
xidlehook --not-when-fullscreen --not-when-audio \
  --timer 600 \
    "xbacklight -d $PRIMARY_DISPLAY = 10 -time 1000" \
    "xbacklight -d $PRIMARY_DISPLAY = $BRIGHTNESS" \
  --timer 30 \
    "xbacklight -d $PRIMARY_DISPLAY = $BRIGHTNESS; betterlockscreen -l dim -s" \
	""

#xautolock -time 5 \ 
#  -locker "betterlockscreen -l dim" \
#  -notify 30 \
#  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
