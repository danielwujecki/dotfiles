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

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
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

conda_init () {
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

yay () {
    RED='\033[0;31m'
    WHITE='\033[0m'

    if [[ -x /usr/bin/pikaur ]] ; then
        pikaur -Syu
        echo "" > $HOME/.cache/current_updates.txt
    else
        echo -e "\n${RED}Pikaur not installed.${WHITE}\n"
        return 1
    fi

    if [[ -x $HOME/.emacs.d/bin/doom ]] ; then
        doom -y upgrade
    else
        echo -e "\n${RED}Doom emacs not installed.${WHITE}\n"
        return 1
    fi

    if [[ -x /usr/bin/nvim ]] ; then
        nvim -c "PlugUpgrade" -c "PlugUpdate" -c "quit" -c "quit"
    else
        echo -e "\n${RED}neovim not installed.${WHITE}\n"
        return 1
    fi

    if [[ -d $HOME/.oh-my-zsh ]] ; then
        omz update
    else
        echo -e "\n${RED}Oh-my-zsh not installed.${WHITE}\n"
        return 1
    fi

    if [[ -d $HOME/.miniconda3 ]] ; then
        zsh -c "source $HOME/.zshrc; conda_init; conda update -y --all"
    else
        echo -e "\n${RED}Dotfiles repository not found.${WHITE}\n"
        return 1
    fi

    if [[ -d $HOME/Repositories/dotfiles ]] ; then
        cd "$HOME"/Repositories/dotfiles
        #KEYPRESENT=$(ssh-add -l | grep 'SHA256:2AGARMHs/fxSTBa/40qGs8PDJNJuuOrr9MpmncwnjTY')
        #if [[ -z $KEYPRESENT ]] ; then
        #    if [[ -f $HOME/.ssh/ssh_rsa_privat ]] ; then
        #        ssh-add ~/.ssh/ssh_rsa_privat
        #    else
        #        echo -e "\n${RED}SSH-Key not found.${WHITE}\n"
        #        return 1
        #    fi
        #fi
        #git pull
    else
        echo -e "\n${RED}Dotfiles repository not found.${WHITE}\n"
        return 1
    fi
}
