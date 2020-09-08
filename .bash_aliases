# wichtigstes kommmando auf dem terminal - ls
alias exa='exa -lat changed --git --color=auto --group-directories-first'
alias ls='exa'
alias l='exa'

# damit jeder alias auch als root funktioniert
alias doas='doas '

# orte
alias ..='cd ../'
alias ...='cd ../../'
alias box='cd ~/Dropbox'
alias des='cd ~/Schreibtisch'
alias sem='cd ~/Dropbox/sose20'
alias repos='cd ~/Repositories'

# shortcuts
#alias f='fzf'
#lias g='git'
#lias v='nvim'
#lias d='docker'
alias r='ranger'
alias vf='nvim $(fzf)'
alias compose='docker-compose'

# programme
alias vi='nvim'
alias vim='nvim'
alias df="df -Th"
alias du="du -sh"
alias rm='rm -I'
alias mv='mv -i'
alias top='htop'
alias tree='exa -T'
alias diff='colordiff'
#alias xclip='xclip -sel c'
alias pac='pikaur'

# usb
alias usbmount='udisksctl mount -b'
alias usbunmount='udisksctl unmount -b'
alias usboff='udisksctl power-off -b'

# ssh
#alias ssh='TERM=xterm-256color ssh'
alias sraspi='ssh pi@192.168.178.38'
#alias sraspif='nautilus sftp://pi@raspberryserver &> /dev/null &'

# python
alias pyc='ipython'
alias mypy='source ~/.virtualenvs/mypython/bin/activate'
alias mypye='deactivate'

# git
#alias push='git push'
#lias pull='git pull'
#lias add='git add'
#lias commit='git commit -m'
#lias log='git log'
#lias status='git status'
#lias checkout='git checkout'
#lias branch='git branch -av'

# misc
alias wetter='curl "wttr.in/Berlin?lang=de"'
