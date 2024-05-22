#!/bin/sh

userresources="$HOME/.Xresources"

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# crazy fix(es)
export _JAVA_AWT_WM_NONREPARENTING=1

# Ensure dbus is either already running, or safely start it
if [[ -z "${DBUS_SESSION_BUS_ADDRESS}" ]] ; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

# gnome-keyring for ssh, gpg, etc. key management
if ! pgrep -u "$LOGNAME" -x gnome-keyring > /dev/null ; then
    export "$(gnome-keyring-daemon --start)"
    [[ -z "$SSH_AUTH_SOCK" ]] || export SSH_AUTH_SOCK
fi

# launch bspwm
exec bspwm > "$HOME/.cache/bspwm.log" 2>&1
