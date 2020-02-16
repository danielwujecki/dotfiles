#!/usr/bin/bash

while pgrep -u $UID -x polybar > /dev/null; do
    killall -q polybar
    sleep 1
done
polybar dockbar &
echo "Bars launched..."
