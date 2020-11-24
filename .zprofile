if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx > $HOME/.config/bspwm/startx.log 2>&1
fi
