if [[ ! $DISPLAY && ($XDG_VTNR -eq 1 || $XDG_VTNR -eq 5) ]]; then
  exec startx > $HOME/.cache/startx.log 2>&1
fi
