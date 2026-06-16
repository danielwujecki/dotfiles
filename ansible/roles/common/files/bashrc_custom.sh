if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Preferred editor
if [[ -x /usr/bin/nvim ]] ; then
    export EDITOR='nvim'
else
    export EDITOR='vi'
fi
