# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.pyenv/bin" ] ; then
    PATH="$HOME/.pyenv/bin:$PATH"
fi

if [ -d "$HOME/.pyenv/shims" ] ; then
    PATH="$HOME/.pyenv/shims:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/daniel/.oh-my-zsh"

ZSH_THEME="myone"
#ZSH_THEME="lukerandall"
# "bira" "gallifrey" "gentoo" "kafeitu" "wuffers"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# user zsh prompt for virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
plugins=(
# general
    #colored-man-pages # see 'set man viewer' below
    history

# python
    virtualenv
    pyenv
    pip

# misc
    docker
    #docker-compose
    #golang
    #fzf
)

source $ZSH/oh-my-zsh.sh

# Preferred editor
if [[ -x /usr/bin/nvim ]] ; then
    export EDITOR='nvim'
else
    export EDITOR='vi'
fi

# set man viewer
#if [[ -x /usr/bin/nvim ]] ; then
#    export MANPAGER="nvim -c 'set ft=man' -"
#fi
if [[ -x /usr/bin/bat ]] ; then
    export MANPAGER="sh -c 'col -bx | bat -l man -n'"
fi

# make virsh compatible with virt-manager
export LIBVIRT_DEFAULT_URI="qemu:///system"

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ] ; then
    . ~/.bash_functions
fi

# command counter
#setopt PROMPT_SUBST
#[[ $cmdcount -ge 1 ]] || cmdcount=1
#preexec() { ((cmdcount++)) }

# nice system info
#if [[ -x /usr/bin/pfetch || -x $HOME/.local/bin/pfetch ]] ; then
#    pfetch
#fi
#if [[ -x $HOME/.local/bin/ufetch ]] ; then
#    ufetch
#fi
