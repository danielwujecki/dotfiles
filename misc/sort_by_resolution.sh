#!/bin/bash

for f in *.jpg *.jpeg *.png ; do
    if [[ ! -f $f ]] ; then
        continue
    fi

    res=$(exiv2 "$f" 2> /dev/null | grep "Bildgröße")
    res=${res#Bildgröße}
    res=${res// /}
    res=${res:1}
    echo "$res"

    if [[ ! -d $res ]] ; then
        mkdir "$res"
    fi

    mv "$f" "$res"
done
