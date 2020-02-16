if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx > $HOME/.startx.log 2>&1
fi
