#!/usr/bin/env bash

# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/exa ]] ; then
    alias ll='exa -Hglm --git --color=auto --group-directories-first'
    alias la='ll -a'
    alias lll='ll'
    alias llll='ll'
    alias tree='exa -Ta'
else
    alias ll='ls -lAh --color=auto --group-directories-first'
    alias lla='ll -a'
fi
if [[ -x /usr/bin/lsd ]] ; then
    alias lo='lsd -lh --group-dirs first'
    alias lp='lo -A'
fi

# damit jeder alias auch als root funktioniert
[[ -x /usr/bin/doas ]] && alias doas='doas '
[[ -x /usr/bin/sudo ]] && alias sudo='sudo '

# orte
alias  ..='cd ../'
alias ...='cd ../../'
[[ -d ~/Repositories ]]          && alias repos='cd ~/Repositories'
[[ -d ~/Studium/masterarbeit ]]  && alias ma='cd ~/Studium/masterarbeit'
[[ -d ~/Studium/wise2223 ]]      && alias sem='cd ~/Studium/wise2223'
[[ -d ~/Repositories/dotfiles ]] && alias dotf='cd ~/Repositories/dotfiles'

# shortcuts
[[ -x /usr/bin/ranger ]] && alias r='ranger'
if [[ -x /usr/bin/tmux ]] ; then
    alias ta='tmux a'
    alias tls='tmux ls'
fi
if [[ -x /usr/bin/systemctl ]] ; then
    alias suspend='systemctl suspend'
    alias hn='systemctl hibernate'
    alias hibernate='systemctl hibernate'
elif [[ -x /bin/loginctl ]] ; then
    alias suspend='loginctl suspend'
    alias hn='loginctl hibernate'
    alias hibernate='loginctl hibernate'
    alias reboot='loginctl reboot'
    alias poweroff='loginctl poweroff'
fi

# programme
alias mv='mv -i'
alias rm='rm -I'
alias rd='rmdir'
alias md='mkdir -p'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
[[ -x /usr/bin/fd ]]        && alias fd='fd -iIH'
[[ -x /usr/bin/rg ]]        && alias rg='rg --hidden'
[[ -x /usr/bin/pwgen ]]     && alias pwgen='pwgen -cns 14 1'
[[ -x /usr/bin/colordiff ]] && alias diff='colordiff'
if [[ -x /usr/bin/nvim ]] ; then
    alias vi='nvim'
    alias vim='nvim'
fi
if [[ -x /usr/bin/emacs && -x /usr/bin/emacsclient ]] ; then
    alias emacs='emacsclient -t -a ""'
fi

# usb
if [[ -x /usr/bin/udisksctl ]] ; then
    alias usbmount='udisksctl mount -b'
    alias usbunmount='udisksctl unmount -b'
    alias usboff='udisksctl power-off -b'
fi

# ssh
[[ -x /usr/bin/ssh ]]                  && alias ssh='TERM=xterm-256color ssh'
[[ -f ~/.ssh/ssh_ed25519_privat ]]     && alias pkssh='ssh-add ~/.ssh/ssh_ed25519_privat'
[[ -f ~/.ssh/ssh_ed25519_innocampus ]] && alias wkssh='ssh-add ~/.ssh/ssh_ed25519_innocampus'

# python
if [[ -f /home/daniel/.pyenv/versions/mypython/bin/activate ]] ; then
    alias mypy='pyenv activate mypython'
    alias mypye='pyenv deactivate'
    alias pyc='ipython'
fi

# misc
if [[ -x /usr/bin/curl ]] ; then
    alias wetter='curl "wttr.in/Berlin?lang=de"'
    alias myip='curl "ifconfig.me/all"'
fi
if [[ -x $HOME/.miniconda3/bin/conda ]] ; then
    alias conda_init='eval "$($HOME/.miniconda3/bin/conda shell.zsh hook)"'
fi
