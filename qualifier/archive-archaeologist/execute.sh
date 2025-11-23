#!/bin/bash
pnpm i tar
mkdir -p out

shopt -s nullglob  
while true; do
    files=(src/*.gz)
    file=${files[0]}
    echo ${#files[@]}
    echo $file
    if [[ -z $file ]]; then
        break
    fi
    echo unarchiving $file
    tar -xvzf "$file" -C "src"
    rm $file
done

file=src/*.txt
mv $file out