#!/usr/bin/env bash
set -euo pipefail

LOCAL_NODES="$(bspc query -N -d focused -n .window)"
TOTAL_NODE_NUM="$(wc -l <<< "$LOCAL_NODES")"
CURRENT_NODE_NUM="$(grep -n "$(bspc query -N -n)" <<< "$LOCAL_NODES" | cut -f1 -d ':')"

echo "($CURRENT_NODE_NUM/$TOTAL_NODE_NUM)"

