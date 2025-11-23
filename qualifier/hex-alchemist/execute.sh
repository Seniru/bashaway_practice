#!/bin/bash
hex=$(printf "%x\n" "$1")
out=""
for (( i = 0; i < ${#hex}; i++ )) do
    c=${hex:i:1}
    if (( i % 2 == 0 )); then
        out+=${c^^}
    else
        out+=${c,,}
    fi
done

echo $out