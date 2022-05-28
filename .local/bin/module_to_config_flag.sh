#!/bin/bash
set -eu

INPUT_FILE="module_list.txt"
OUTPUT_FILE="found_config_flags.txt"

for mod in $(cat "$INPUT_FILE") ; do
    results="$(
        curl -s "https://www.kernelconfig.io/search?q=$mod.ko&kernelversion=5.17.11&arch=x86" | \
        grep 'CONFIG' | \
        sed 's:.*\(CONFIG_[a-zA-Z0-9_]\+\).*:\1:g'
    )"

    echo "Module: $mod"
    echo "Module: $mod" >> "$OUTPUT_FILE"
    echo "$results"     >> "$OUTPUT_FILE"
    echo "------------" >> "$OUTPUT_FILE"
    echo ""             >> "$OUTPUT_FILE"
done
