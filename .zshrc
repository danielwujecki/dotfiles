# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/daniel/.oh-my-zsh"

#ZSH_THEME="bira"
ZSH_THEME="myone"

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
    colored-man-pages
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

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

# command counter
#setopt PROMPT_SUBST
#[[ $cmdcount -ge 1 ]] || cmdcount=1
#preexec() { ((cmdcount++)) }

# nice system info
if [[ -x /usr/bin/pfetch || -x $HOME/.local/bin/pfetch ]] ; then
    pfetch
fi
#if [[ -x $HOME/.local/bin/ufetch ]] ; then
#    ufetch
#fi

init_conda () {
    __conda_setup="$('/home/daniel/.miniconda3/bin/conda' 'shell.zsh' 'hook')"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/daniel/.miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/daniel/.miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/daniel/.miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}
