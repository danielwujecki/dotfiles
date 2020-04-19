if [ -x /usr/bin/dircolors ]; then
    alias exa='exa -lat changed --git --color=auto --group-directories-first'
    alias ls='exa'
    alias l='exa'
fi

# damit jeder alias auch als root funktioniert
alias sudo='sudo '

# orte
alias ..='cd ../'
alias ...='cd ../../'
alias box='cd ~/Dropbox'
alias des='cd ~/Schreibtisch'
alias sem='cd ~/Dropbox/sose20'
alias repos='cd ~/Repositories'

# shortcuts
alias f='fzf'
alias g='git'
alias v='vim'
alias d='docker'
alias r='ranger'
alias vf='vim $(fzf)'
alias compose='docker-compose'

#programme
alias vi='vim'
alias df="df -Th"
alias rm='rm -I'
alias mv='mv -i'
alias top='htop'
alias tree='exa -T'
alias diff='colordiff'
alias xclip='xclip -sel c'
alias pac='pacman'
alias spac='sudo pacman'
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
alias branch='git branch -av'

# misc
alias wetter='curl "wttr.in/Berlin?lang=de"'
