#!/bin/bash

directories="$(ls -d */)"

for d in $directories ; do
    cd $d
    if [ -d .git ]; then
        git pull
    fi
    cd ../
done
