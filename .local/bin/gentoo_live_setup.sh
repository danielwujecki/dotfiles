#!/bin/bash
set -euo pipefail

sed -i '/^192.168.178.33/d' ~/.ssh/known_hosts
ssh root@192.168.178.33 mkdir .ssh
scp ~/.ssh/authorized_keys root@192.168.178.33:.ssh
scp ~/.tmux.conf root@192.168.178.33:
scp ~/Repositories/dotfiles/.local/bin/mount_gentoo.sh root@192.168.178.33:
#ssh root@192.168.178.33
