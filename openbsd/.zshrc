# Path to your oh-my-zsh installation.
export ZSH="/home/daniel/.oh-my-zsh"

# set default user - important for ZSH_THEME
export DEFAULT_USER="daniel"

# user zsh prompt for virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# command counter
#setopt PROMPT_SUBST
#[[ $cmdcount -ge 1 ]] || cmdcount=1
#preexec() { ((cmdcount++)) }

#ZSH_THEME="bira"
ZSH_THEME="myone"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
plugins=(
# general
    #colored-man-pages
    history
    #vi-mode

# tools
    #docker
    #docker-compose

# python
    #virtualenv
    #pyenv
    #pip

# misc
    #golang
)

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

# Preferred editor
if [[ -x /usr/bin/nvim ]] ; then
    export EDITOR='nvim'
else
    export EDITOR='vi'
fi

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

export TERM='xterm-256color'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# nice system info
if [[ -x /usr/bin/pfetch || -x $HOME/.local/bin/pfetch ]] ; then
    pfetch
fi
#if [[ -x $HOME/.local/bin/ufetch ]] ; then
#    ufetch
#fi
