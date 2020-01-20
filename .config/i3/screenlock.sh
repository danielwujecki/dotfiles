#!/usr/bin/bash

wp_path="$HOME/Bilder/wallpapers/selected"
sel_wp=$(ls "$wp_path" | shuf -n 1)

icon="$HOME/.config/i3/circlelock.png"
tmpimg='/tmp/screen_locked.png'

# add the lock
convert "$wp_path/$sel_wp" "$icon" -gravity center -composite -scale 2560x1440 "$tmpimg" 

# Lock screen displaying this image.
i3lock -n -t -i "$tmpimg"

# wait and clean up
sleep 1
# rm $tmpimg
