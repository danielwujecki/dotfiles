# wichtigstes kommmando auf dem terminal - ls
if [[ -x /usr/bin/exa ]] ; then
    alias exa='exa -lat changed --git --color=auto --group-directories-first'
    alias ls='exa'
    alias l='exa'
    alias tree='exa -T'
else
    alias ls='ls -lAh --color=auto --group-directories-first'
    alias l='ls'
fi

if [[ -x /usr/bin/doas ]] ; then
    # damit jeder alias auch als root funktioniert
    alias doas='doas '
fi

# orte
alias ..='cd ../'
alias ...='cd ../../'
if [[ -d ~/Dropbox ]] ; then alias box='cd ~/Dropbox' ; fi
if [[ -d ~/Schreibtisch ]] ; then alias alias des='cd ~/Schreibtisch' ; fi
if [[ -d ~/Dropbox/sose20 ]] ; then alias alias sem='cd ~/Dropbox/sose20' ; fi
if [[ -d ~/Repositories ]] ; then alias alias repos='cd ~/Repositories' ; fi

# shortcuts
if [[ -x /usr/bin/ranger ]] ; then alias r='ranger' ; fi
if [[ -x /usr/bin/nvim && -x /usr/bin/fzf ]] ; then alias vf='nvim $(fzf)' ; fi
if [[ -x /usr/bin/docker-compose ]] ; then alias compose='docker-compose' ; fi

# programme
if [[ -x /usr/bin/nvim ]] ; then 
    alias vi='nvim'
    alias vim='nvim'
fi
alias df="df -Th"
alias du="du -sh"
#alias rm='rm -I'
alias mv='mv -i'
if [[ -x /usr/bin/nvim ]] ; then alias top='htop' ; fi
if [[ -x /usr/bin/colordiff ]] ; then alias diff='colordiff' ; fi
if [[ -x /usr/bin/xclip ]] ; then alias xclip='xclip -sel c' ; fi
if [[ -x /usr/bin/pikaur ]] ; then alias alias pac='pikaur' ; fi

# usb
if [[ -x /usr/bin/udisksctl ]] ; then
    alias usbmount='udisksctl mount -b'
    alias usbunmount='udisksctl unmount -b'
    alias usboff='udisksctl power-off -b'
fi

# ssh
#alias ssh='TERM=xterm-256color ssh'
#alias sraspi='ssh pi@192.168.178.38'
#alias sraspif='nautilus sftp://pi@raspberryserver &> /dev/null &'

# python
alias pyc='ipython'
if [[ -f ~/.virtualenvs/mypython/bin/activate ]] ; then
    alias mypy='source ~/.virtualenvs/mypython/bin/activate'
fi
alias mypye='deactivate'

# misc
if [[ -x /usr/bin/curl ]] ; then alias wetter='curl "wttr.in/Berlin?lang=de"' ; fi
