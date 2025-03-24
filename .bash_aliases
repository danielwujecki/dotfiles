#!/usr/bin/env bash

# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/eza ]] ; then
    alias ll='eza -lgm --color=auto --group-directories-first'
    alias la='ll -a'
    alias lll='ll'
    alias llll='ll'
    alias tree='eza -Ta'
else
    alias ll='ls -lh --color=auto --group-directories-first'
    alias la='ll -A'
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
[[ -d ~/Repositories ]]                                  && alias repos='cd ~/Repositories'
[[ -f ~/Studium/masterarbeit/setpath.sh ]]               && alias ma='cd ~/Studium/masterarbeit && source setpath.sh'
[[ -d ~/Repositories/dotfiles ]]                         && alias dotf='cd ~/Repositories/dotfiles'
[[ -d ~/Dokumente/innocampus/svn-server/Dokumentation ]] && alias inca='cd ~/Dokumente/innocampus/svn-server'

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
alias mv='mv -vi'
alias rm='rm -vI'
alias rd='rmdir'
alias md='mkdir -p'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
[[ -x /usr/bin/fd ]]        && alias fd='fd -iIH'
[[ -x /usr/bin/fdfind ]]    && alias fd='fdfind -iIH'
[[ -x /usr/bin/rg ]]        && alias rg='rg --hidden'
[[ -x /usr/bin/colordiff ]] && alias diff='colordiff'
if [[ -x /usr/bin/emacs && -x /usr/bin/emacsclient ]] ; then
    alias emacs='emacsclient -na ""'
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
    alias pyc='[[ -n $VIRTUAL_ENV ]] || pyenv activate mypython ; ipython'
fi

# misc
[[ -f /etc/portage/make.conf ]] && alias make.conf='doas nvim /etc/portage/make.conf'

if [[ -x $HOME/.miniconda3/bin/conda ]] ; then
    alias conda_init='eval "$($HOME/.miniconda3/bin/conda shell.zsh hook)"'
fi

if [[ -x /usr/bin/curl ]] ; then
    alias wetter='curl "wttr.in/Berlin?lang=de"'
    alias myip='curl "ifconfig.me/all"'
fi

alias thunderbird_backup="tar -cvf "thunderbird-backup-$(date +'%y-%m-%d').tgz" -I pigz -C "$HOME" .thunderbird"
