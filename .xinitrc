#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --dpi 128 --output DP1 --off --output DP2 --off --output HDMI1 --off --output VIRTUAL1 --off
exec i3 > $HOME/.i3.log 2>&1
# exec bspwm > $HOME/.bspwm.log 2>&1
