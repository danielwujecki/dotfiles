#!/usr/bin/bash

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
if [[ -x /usr/bin/doas ]] ; then
    alias doas='doas '
fi
if [[ -x /usr/bin/sudo ]] ; then
    alias sudo='sudo '
fi

# orte
alias ..='cd ../'
alias ...='cd ../../'
if [[ -d ~/Dropbox ]] ; then alias dbox='cd ~/Dropbox' ; fi
if [[ -d ~/Schreibtisch ]] ; then alias des='cd ~/Schreibtisch' ; fi
if [[ -d ~/Repositories ]] ; then alias repos='cd ~/Repositories' ; fi
if [[ -d ~/Dropbox/wise2122 ]] ; then alias sem='cd ~/Dropbox/wise2122' ; fi
if [[ -d ~/Dokumente/3dprinting ]] ; then alias 3d='cd ~/Dokumente/3dprinting' ; fi
if [[ -d ~/Repositories/dotfiles ]] ; then alias dotf='cd ~/Repositories/dotfiles' ; fi

# shortcuts
if [[ -x /usr/bin/ranger ]] ; then alias r='ranger' ; fi
if [[ -x /usr/bin/nvim && -x /usr/bin/fzf ]] ; then alias vf='nvim $(fzf)' ; fi
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
if [[ -x /usr/bin/bat ]] ; then alias cat='bat' ; fi
if [[ -x /usr/bin/fd ]] ; then alias fd='fd -iIH' ; fi
if [[ -x /usr/bin/htop ]] ; then alias top='htop' ; fi
if [[ -x /usr/bin/colordiff ]] ; then alias diff='colordiff' ; fi
if [[ -x /usr/bin/xclip ]] ; then alias xclip='xclip -sel c' ; fi
if [[ -x /usr/bin/pwgen ]] ; then alias pwgen='pwgen -cns 14 1' ; fi
if [[ -x /usr/bin/nvim ]] ; then
    alias vi='nvim'
    alias vim='nvim'
fi
if [[ -x /usr/bin/emacs && -x /usr/bin/emacsclient ]] ; then
    alias emacs='emacsclient -t -a ""'
fi
if [[ -x /usr/bin/latexmk ]] ; then
    alias latex='latexmk'
fi
if [[ -x /usr/bin/pikaur ]] ; then
    alias pac='pikaur'
fi

# usb
if [[ -x /usr/bin/udisksctl ]] ; then
    alias usbmount='udisksctl mount -b'
    alias usbunmount='udisksctl unmount -b'
    alias usboff='udisksctl power-off -b'
fi

# ssh
alias ssh='TERM=xterm-256color ssh'

if [[ -f ~/.ssh/ssh_ed25519_privat ]] ; then
    alias pkssh='ssh-add ~/.ssh/ssh_ed25519_privat'
fi
if [[ -f ~/.ssh/ssh_ed25519_innocampus ]] ; then
    alias wkssh='ssh-add ~/.ssh/ssh_ed25519_innocampus'
fi

# python
if [[ -f /home/daniel/.pyenv/versions/mypython/bin/activate ]] ; then
    alias mypy='pyenv activate mypython'
    alias mypye='pyenv deactivate'
fi
alias pyc='ipython'

# misc
if [[ -x /usr/bin/curl ]] ; then
    alias wetter='curl "wttr.in/Berlin?lang=de"'
    alias myip='curl "ifconfig.me/all"'
fi
