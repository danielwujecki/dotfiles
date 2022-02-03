if [[ -x $HOME/.pyenv/bin/pyenv ]] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

if [[ ! $DISPLAY && ($XDG_VTNR -eq 1 || $XDG_VTNR -eq 5) ]]; then
  exec startx > "$HOME/.cache/startx.log" 2>&1
fi
