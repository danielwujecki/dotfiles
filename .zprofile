if [[ ! $DISPLAY && $XDG_VTNR -eq 5 ]]; then
  exec startx > $HOME/.config/bspwm/startx.log 2>&1
fi
