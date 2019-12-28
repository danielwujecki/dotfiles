#!/bin/bash

DIR="$(command ls -d */)"

for d in $DIR
do
    cd $d
    if [ -d .git ]; then
        git pull
        git push
    fi
    cd ../
done
