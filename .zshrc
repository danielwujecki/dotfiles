# other nice themes: "bira" "gallifrey" "gentoo" "kafeitu" "wuffers"
if [[ -n $SSH_CONNECTION ]] ; then
    ZSH_THEME="lukerandall"
else
    ZSH_THEME="myone"
fi

# user zsh prompt for virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Use this setting if you want to disable marking untracked files under VCS as dirty.
# This makes repository status checks for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY=true

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
plugins=(
# general
    colored-man-pages # also see 'set man viewer' below
    history

# python
    virtualenv
    pyenv
    pip

# misc
    docker
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/Repositories/dotfiles/oh-my-zsh"
export ZSH_CACHE_DIR="$HOME/.oh-my-zsh/cache"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
source "$ZSH/oh-my-zsh.sh"

unsetopt auto_pushd

ZSH_SYNTAX_HIGHLIGHTING="/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh"
[[ -f $ZSH_SYNTAX_HIGHLIGHTING ]] && source "$ZSH_SYNTAX_HIGHLIGHTING"

# do not automatically update
zstyle ':omz:update' mode disabled

# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    export PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

# Preferred editor
if [[ -x /usr/bin/nvim ]] ; then
    export EDITOR='nvim'
else
    export EDITOR='vi'
fi

# make virsh compatible with virt-manager
export LIBVIRT_DEFAULT_URI="qemu:///system"
