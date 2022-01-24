#!/usr/bin/env bash
set -euo pipefail

# -Q = Query
# -q = less information

# -d = installed as dependency
# -e = explicitly installed
# -t = packages not required by any package
# -tt = same as -t, but ignoring optional deps

# -n = packages found in repos
# -m = aur packages

pacman -Qqme > pkgs_aur.txt
pacman -Qqne > pkgs_repos.txt
