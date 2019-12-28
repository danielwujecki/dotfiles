#!/bin/bash

# ALL PDF FILES IN DIRECTORY AS ONE FILE

CMD="pdftk"
FILE=$(ls *.pdf | sort -V)
for i in $FILE
do
    CMD="$CMD $i"
done
CMD="$CMD cat output all_files.pdf"
$CMD
