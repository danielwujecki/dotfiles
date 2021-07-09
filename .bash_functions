#!/usr/bin/env bash

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
        pikaur -Syu || return 1
        echo "" > $HOME/.cache/current_updates.txt
    else
        echo -e "\n${RED}Pikaur not installed.${WHITE}\n"
        return 1
    fi

    if [[ -x /usr/bin/flatpak ]] ; then
        flatpak update || return 1
    else
        echo -e "\n${RED}Flatpak not installed.${WHITE}\n"
    fi

    if [[ -x $HOME/.emacs.d/bin/doom ]] ; then
        doom -y upgrade || return 1
    else
        echo -e "\n${RED}Doom emacs not installed.${WHITE}\n"
    fi

    if [[ -x /usr/bin/nvim ]] ; then
        nvim -c "PlugUpgrade" -c "PlugUpdate" -c "quit" -c "quit" || return 1
    else
        echo -e "\n${RED}neovim not installed.${WHITE}\n"
    fi

    if [[ -d $HOME/.oh-my-zsh ]] ; then
        omz update || return 1
    else
        echo -e "\n${RED}Oh-my-zsh not installed.${WHITE}\n"
    fi

    if [[ -d $HOME/.miniconda3 ]] ; then
        zsh -c "source $HOME/.zshrc; conda_init; conda update -y --all" || return 1
    else
        echo -e "\n${RED}Dotfiles repository not found.${WHITE}\n"
    fi
}

folder () {
    if [[ $# -gt 1 ]] ; then
        echo "Usage: $0 [path]"
        return 1
    fi

    if [[ $1 ]] ; then
        if [[ ! -d $1 ]] ; then
            echo " $1 is not a directory."
            return 1
        fi
        NAUTILUSPATH="$1"
    else
        NAUTILUSPATH="./"
    fi

    zsh -c "nautilus $NAUTILUSPATH > /dev/null 2>&1 &!"
}
