#!/usr/bin/bash

# dotfiles in ~/
cp "$HOME"/.bash_aliases "$HOME"/Repositories/dotfiles/
#cp "$HOME"/.bashrc "$HOME"/Repositories/dotfiles/
#cp "$HOME"/.gitconfig "$HOME"/Repositories/dotfiles/
cp "$HOME"/.gtkrc-2.0 "$HOME"/Repositories/dotfiles/
cp "$HOME"/.latexmkrc "$HOME"/Repositories/dotfiles/
cp "$HOME"/.tmux.conf "$HOME"/Repositories/dotfiles/
cp "$HOME"/.xinitrc "$HOME"/Repositories/dotfiles/
#cp "$HOME"/.Xresources "$HOME"/Repositories/dotfiles/
cp "$HOME"/.zprofile "$HOME"/Repositories/dotfiles/
cp "$HOME"/.zshrc "$HOME"/Repositories/dotfiles/

# ~/.config
cp "$HOME"/.config/bspwm/bspwmrc "$HOME"/Repositories/dotfiles/.config/bspwm/
cp -r "$HOME"/.config/dunst "$HOME"/Repositories/dotfiles/.config/
cp -r "$HOME"/.config/gtk-3.0 "$HOME"/Repositories/dotfiles/.config/
cp -r "$HOME"/.config/kitty "$HOME"/Repositories/dotfiles/.config/
cp "$HOME"/.config/nvim/init.vim "$HOME"/Repositories/dotfiles/.config/nvim/
#cp -r "$HOME"/.config/pacman "$HOME"/Repositories/dotfiles/.config/
cp -r "$HOME"/.config/picom "$HOME"/Repositories/dotfiles/.config/
cp "$HOME"/.config/polybar/check_updates.sh "$HOME"/Repositories/dotfiles/.config/polybar/
cp "$HOME"/.config/polybar/config "$HOME"/Repositories/dotfiles/.config/polybar/
cp "$HOME"/.config/polybar/spotify_status.py "$HOME"/Repositories/dotfiles/.config/polybar/
cp "$HOME"/.config/ranger/commands.py "$HOME"/Repositories/dotfiles/.config/ranger/
cp "$HOME"/.config/ranger/commands_full.py "$HOME"/Repositories/dotfiles/.config/ranger/
cp "$HOME"/.config/ranger/rc.conf "$HOME"/Repositories/dotfiles/.config/ranger/
cp "$HOME"/.config/ranger/rifle.conf "$HOME"/Repositories/dotfiles/.config/ranger/
cp "$HOME"/.config/ranger/scope.sh "$HOME"/Repositories/dotfiles/.config/ranger/
cp -r "$HOME"/.config/rofi "$HOME"/Repositories/dotfiles/.config/
cp "$HOME"/.config/sxhkd/keymap.tex "$HOME"/Repositories/dotfiles/.config/sxhkd/
cp "$HOME"/.config/sxhkd/sxhkdrc "$HOME"/Repositories/dotfiles/.config/sxhkd/
cp "$HOME"/.config/sxhkd/hotkeys_unused "$HOME"/Repositories/dotfiles/.config/sxhkd/
cp -r "$HOME"/.config/zathura "$HOME"/Repositories/dotfiles/.config/
cp "$HOME"/.config/pikaur.conf "$HOME"/Repositories/dotfiles/.config/
cp "$HOME"/.config/redshift.conf "$HOME"/Repositories/dotfiles/.config/
#cp -r "$HOME"/.config/alacritty "$HOME"/Repositories/dotfiles/.config/
#cp "$HOME"/.config/Code/User/keybindings.json "$HOME"/Repositories/dotfiles/.config/Code/User/
#cp "$HOME"/.config/Code/User/settings.json "$HOME"/Repositories/dotfiles/.config/Code/User/
#cp -r "$HOME"/.config/i3 "$HOME"/Repositories/dotfiles/.config/
#cp -r "$HOME"/.config/i3blocks "$HOME"/Repositories/dotfiles/.config/
#cp -r "$HOME"/.config/sublime-text-3/Packages/User \
#    "$HOME"/Repositories/dotfiles/.config/sublime-text-3/Packages/
#cp -r "$HOME"/.config/termite "$HOME"/Repositories/dotfiles/.config/
#cp -r "$HOME"/.config/yay "$HOME"/Repositories/dotfiles/.config/
#cp "$HOME"/.config/user-dirs.dirs "$HOME"/Repositories/dotfiles/.config/
#cp "$HOME"/.config/user-dirs.locale "$HOME"/Repositories/dotfiles/.config/

# ~/.local/
cp -r "$HOME"/.local/bin/dock "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/fehbg "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/homesyncup "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/homesyncdown "$HOME"/Repositories/dotfiles/.local/bin/
#cp -r "$HOME"/.local/bin/polybar_dock "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/polybar_normal "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/pycl "$HOME"/Repositories/dotfiles/.local/bin/
#cp -r "$HOME"/.local/bin/screenlock "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/texclean "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/toggletouchpad "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/bin/undock "$HOME"/Repositories/dotfiles/.local/bin/
cp -r "$HOME"/.local/share/applications/emacs.desktop \
    "$HOME"/Repositories/dotfiles/.local/share/applications

# misc folders in ~/
cp "$HOME"/.oh-my-zsh/custom/themes/myone.zsh-theme \
    "$HOME"/Repositories/dotfiles/.oh-my-zsh/custom/themes/
cp "$HOME"/.oh-my-zsh/custom/themes/myone-old.zsh-theme \
    "$HOME"/Repositories/dotfiles/.oh-my-zsh/custom/themes/
cp "$HOME"/.jupyter/jupyter_notebook_config.py "$HOME"/Repositories/dotfiles/.jupyter/
cp -r "$HOME"/.local/share/nvim/site/autoload \
    "$HOME"/Repositories/dotfiles/.local/share/nvim/site/
cp -r "$HOME"/.doom.d "$HOME"/Repositories/dotfiles/

# dotfiles in /etc
cp /etc/doas.conf "$HOME"/Repositories/dotfiles/etc/
cp /etc/pacman.conf "$HOME"/Repositories/dotfiles/etc/
cp /etc/thinkfan.conf "$HOME"/Repositories/dotfiles/etc/

echo "Done with sync to repo!"
