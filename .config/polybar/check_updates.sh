#!/usr/bin/bash

# run this as crontab, rather than a polybar module

# check for network
ping -c1 "archlinux.org"
if [[ $? -ne 0 ]] ; then
    echo "No network connection!" > /dev/stderr
    exit 2
fi

filepath="$HOME/.cache/current_updates.txt"

upac=$(checkupdates | wc -l)
uaur=$(pikaur -Qua 2> /dev/null | wc -l)

if [[ $upac -gt 0 ]] ; then
    if [[ $upac -eq 1 ]] ; then
        upac="$upac update"
    else
        upac="$upac updates"
    fi
else
    upac=""
fi

if [[ $uaur -gt 0 ]] ; then
    if [[ -n $upac ]] ; then
        uaur="; $uaur aur"
    else
        uaur="$uaur aur"
    fi
else
    uaur=""
fi

if [[ -n $upac || -n $uaur ]] ; then
    echo "($upac$uaur)" > "$filepath"
else
    echo "" > "$filepath"
fi
