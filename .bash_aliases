#!/usr/bin/env bash

# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/exa ]] ; then
    alias ll='exa -Hglam --git --color=auto --group-directories-first'
    alias lll='ll'
    alias llll='ll'
    alias tree='exa -Ta'
else
    alias ll='ls -lAh --color=auto --group-directories-first'
fi

# damit jeder alias auch als root funktioniert
[[ -x /usr/bin/doas ]] && alias doas='doas '
[[ -x /usr/bin/sudo ]] && alias sudo='sudo '

# orte
alias  ..='cd ../'
alias ...='cd ../../'
[[ -d ~/Dropbox ]]               && alias dbox='cd ~/Dropbox'
[[ -d ~/Schreibtisch ]]          && alias des='cd ~/Schreibtisch'
[[ -d ~/Repositories ]]          && alias repos='cd ~/Repositories'
[[ -d ~/Dropbox/wise2122 ]]      && alias sem='cd ~/Dropbox/wise2122'
[[ -d ~/Dokumente/3dprinting ]]  && alias 3d='cd ~/Dokumente/3dprinting'
[[ -d ~/Repositories/dotfiles ]] && alias dotf='cd ~/Repositories/dotfiles'

# shortcuts
[[ -x /usr/bin/ranger ]] && alias r='ranger'
[[ -x /usr/bin/nvim && -x /usr/bin/fzf ]] && alias vf='nvim $(fzf)'
if [[ -x /bin/loginctl ]] ; then
    alias suspend='loginctl suspend'
    alias hn='loginctl hibernate'
    alias hibernate='loginctl hibernate'
    alias reboot='loginctl reboot'
    alias poweroff='loginctl poweroff'
fi
if [[ -x /usr/bin/rclone && -d ~/Dropbox ]] ; then
    alias dboxup='rclone sync -i ~/Dropbox Dropbox:/'
    alias dboxdown='rclone sync -i Dropbox:/ ~/Dropbox'
    alias dboxupf='rclone sync -P ~/Dropbox Dropbox:/'
    alias dboxdownf='rclone sync -P Dropbox:/ ~/Dropbox'
fi

# programme
alias df='df -Th'
alias du='du -sh'
alias rm='rm -I'
alias mv='mv -i'
[[ -x /usr/bin/fd ]]        && alias fd='fd -iIH'
[[ -x /usr/bin/xclip ]]     && alias xclip='xclip -sel c'
[[ -x /usr/bin/pwgen ]]     && alias pwgen='pwgen -cns 14 1'
[[ -x /usr/bin/latexmk ]]   && alias latex='latexmk'
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
