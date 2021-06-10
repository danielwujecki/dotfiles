#!/usr/bin/bash

# -Q = Query
# -q = less information

# -d = installed as dependency
# -e = explicitly installed
# -t = packages not required by any pacakge
# -tt = same as -t, but ignoring optional deps

# -n = packages found in repos
# -m = aur packages

# folgende listen sollten disjunkt sein
pacman -Qqnd > pkgs_dependencies.txt
pacman -Qqne > pkgs_explicitly.txt
# und zusammen alle installierten Pakete enthalten
pacman -Qqn  > pkgs_all.txt

# pakete die explizit installiert wurden
# und keine abhängigkeit für ein anderes
# paket sind
pacman -Qqnett > pkgs_not_req.txt

# AUR packages explicitly installed
pacman -Qqme > pkgs_aur_expl.txt
