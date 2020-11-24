#!/usr/bin/bash

# dotfiles in ~/
cp $HOME/Repositories/dotfiles/.bash_aliases $HOME/
#cp $HOME/Repositories/dotfiles/.bashrc $HOME/
#cp $HOME/Repositories/dotfiles/.gitconfig $HOME/
#cp $HOME/Repositories/dotfiles/.gtkrc-2.0 $HOME/
cp $HOME/Repositories/dotfiles/.tmux.conf $HOME/
cp $HOME/Repositories/dotfiles/.xinitrc $HOME/
#cp $HOME/Repositories/dotfiles/.Xresources $HOME/
cp $HOME/Repositories/dotfiles/.zprofile $HOME/
cp $HOME/Repositories/dotfiles/.zshrc $HOME/

# ~/.config
cp -r $HOME/Repositories/dotfiles/.config/bspwm $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/dunst $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/gtk-3.0 $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/kitty $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/nvim $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/pacman $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/picom $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/polybar $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/ranger $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/rofi $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/sxhkd $HOME/.config/
cp -r $HOME/Repositories/dotfiles/.config/zathura $HOME/.config/
cp $HOME/Repositories/dotfiles/.config/pikaur.conf $HOME/.config/
cp $HOME/Repositories/dotfiles/.config/redshift.conf $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/alacritty $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/Code/User $HOME/.config/Code
#cp -r $HOME/Repositories/dotfiles/.config/i3 $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/i3blocks $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/sublime-text-3/Packages/User \
#    $HOME/.config/sublime-text-3/Packages/
#cp -r $HOME/Repositories/dotfiles/.config/termite $HOME/.config/
#cp -r $HOME/Repositories/dotfiles/.config/yay $HOME/.config/
#cp $HOME/Repositories/dotfiles/.config/user-dirs.dirs $HOME/.config/
#cp $HOME/Repositories/dotfiles/.config/user-dirs.locale $HOME/.config/

# ~/.local/bin
#cp -r $HOME/Repositories/dotfiles/.local/bin/dock $HOME/.local/bin/
cp -r $HOME/Repositories/dotfiles/.local/bin/fehbg $HOME/.local/bin/
#cp -r $HOME/Repositories/dotfiles/.local/bin/polybar_dock $HOME/.local/bin/
cp -r $HOME/Repositories/dotfiles/.local/bin/polybar_normal $HOME/.local/bin/
cp -r $HOME/Repositories/dotfiles/.local/bin/pycl $HOME/.local/bin/
#cp -r $HOME/Repositories/dotfiles/.local/bin/screenlock $HOME/.local/bin/
cp -r $HOME/Repositories/dotfiles/.local/bin/texclean $HOME/.local/bin/
cp -r $HOME/Repositories/dotfiles/.local/bin/toggletouchpad $HOME/.local/bin/
#cp -r $HOME/Repositories/dotfiles/.local/bin/undock $HOME/.local/bin/

# misc folders in ~/
cp -r $HOME/Repositories/dotfiles/.oh-my-zsh $HOME/
cp -r $HOME/Repositories/dotfiles/.jupyter $HOME/
cp -r $HOME/Repositories/dotfiles/.local/share/nvim/site/autoload \
    $HOME/.local/share/nvim/site/
cp -r $HOME/Repositories/dotfiles/.doom.d $HOME/

# dotfiles in /etc
#doas cp $HOME/Repositories/dotfiles/etc/doas.conf /etc/
#doas cp $HOME/Repositories/dotfiles/etc/pacman.conf /etc/
#doas cp $HOME/Repositories/dotfiles/etc/thinkfan.conf /etc/
