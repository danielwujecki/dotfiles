#!/bin/sh

userresources="$HOME/.Xresources"

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# crazy fix(es)
export _JAVA_AWT_WM_NONREPARENTING=1

# gnome-keyring for ssh, gpg etc. key management
pgrep -u "$LOGNAME" -x gnome-keyring > /dev/null || eval "$(gnome-keyring-daemon --start)"
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

# launch bspwm in dbus-session
exec dbus-run-session bspwm > "$HOME/.cache/bspwm.log" 2>&1
