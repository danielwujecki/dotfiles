#!/bin/bash

CONF_A="defconfig"
CONF_B="config-5.15.43-gentoo-commodore"

for cfg_yes in $(cat "$CONF_A" | rg '=y') ; do
    cfg_mod="$(echo "$cfg_yes" | sed 's/=y/=m/g')"
    cfg="$(echo "$cfg_yes" | sed 's/=y//g')"
    if ! grep -iq "$cfg_yes" "$CONF_B" && ! grep -iq "$cfg_mod" "$CONF_B" ; then
        echo "$cfg"
    fi
done
