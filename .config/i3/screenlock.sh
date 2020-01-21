#!/usr/bin/bash

wp_path="$HOME/Bilder/wallpaper/selected"
icon="$HOME/.config/i3/circlelock.png"
tmpimg='/tmp/screen_locked.png'

if [ ! -d $wp_path -o ! -f $icon ] ; then
    i3lock -n
    exit
fi

until [ -f "$wp_path/$sel_wp" ] ; do
    sel_wp=$(ls "$wp_path" | shuf -n 1)
done

# add the lock
convert "$wp_path/$sel_wp" -scale 2560x1440 "$tmpimg"
convert "$tmpimg" "$icon" -gravity center -composite "$tmpimg" 

# Lock screen displaying this image.
i3lock -n -t -i "$tmpimg"

# wait and clean up
sleep 1
rm $tmpimg
