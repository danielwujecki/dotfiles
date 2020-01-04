if [ -x /usr/bin/dircolors ]; then
    # zeige durch ls immer alle Dateien als Liste an
    alias ls='ls -lhA --color=auto --group-directories-first'
fi

# damit jeder alias auch als root funktioniert
alias sudo='sudo '
alias rm='rm -I'

# orte
alias des='cd ~/Schreibtisch'
alias box='cd ~/Dropbox'
alias sem='cd ~/Dropbox/wise1920'
alias repos='cd ~/Repositories'
alias ..='cd ../'
alias ...='cd ../../'

# programme
alias top='htop'
alias emacs='emacsclient -nc'
alias diff='colordiff'
alias xclip='xclip -sel c'
alias pacman='sudo pacman'
alias chrome='google-chrome-stable'

# usb
alias mount='udisksctl mount -b'
alias unmount='udisksctl unmount -b'
alias usboff='udisksctl power-off -b'

# ssh
alias ssh='TERM=xterm-256color ssh'
alias sraspi='ssh pi@192.168.178.38'
alias sraspif='nautilus sftp://pi@raspberryserver &> /dev/null &'

# python
alias pyc='ipython'
alias mypy='source ~/.virtualenvs/mypython/bin/activate'
alias mypye='deactivate'

# git
alias push='git push'
alias pull='git pull'
alias add='git add'
alias commit='git commit -m'
alias log='git log'
alias status='git status'
alias checkout='git checkout'
alias branch='git branch -v'

# misc
alias wetter='curl "wttr.in/Berlin?lang=de"'
