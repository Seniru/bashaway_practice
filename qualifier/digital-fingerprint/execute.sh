#!/bin/bash

shopt -s globstar nullglob

mkdir -p out
echo -n > out/checksums.txt

for file in src/**/**; do
    if [[ -d $file ]]; then
        continue
    fi
    echo "$(md5sum "$file" | cut -d' ' -f1) ${file#src/}" >> out/checksums.txt
done
