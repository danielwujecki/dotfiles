#!/usr/bin/bash

# set working directory
cd /tmp

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/.config/i3/circlelock.png"
tmpimg='screen_locked.png'
# wallpaper="$HOME/.config/i3/lockscreen.jpg"

# Take a screenshot
scrot $tmpimg 
# take wallpaper
# cp $wallpaper $tmpimg

# Pixellate it 10x
mogrify -scale 10% -scale 1000% "$tmpimg"

# add the icon
convert "$tmpimg" "$icon" -gravity center -composite "$tmpimg"

# Lock screen displaying this image.
i3lock -n -t -i "$tmpimg" &

# wait and clean up
sleep 1
rm $tmpimg
