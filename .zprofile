if [[ ! $DISPLAY && ($XDG_VTNR -eq 1 || $XDG_VTNR -eq 5) ]]; then
  exec startx > /tmp/startx.log 2>&1
fi
