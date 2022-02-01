#!/bin/sh

userresources="$HOME/.Xresources"

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# crazy fix(es)
export _JAVA_AWT_WM_NONREPARENTING=1

pgrep -u "$LOGNAME" -x ssh-agent > /dev/null || eval "$(ssh-agent)"
exec dbus-run-session bspwm > "$HOME/.cache/bspwm.log" 2>&1
