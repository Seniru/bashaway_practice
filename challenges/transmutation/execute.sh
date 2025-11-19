#!/bin/bash

# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encode URI Component (the thing flags this)

str="${1}"
n=${#str}

encoded=""

for (( i = 0; i < $n; i++ )); do
    c=${str:i:1}
    case "$c" in
        [A-Za-z0-9-.!~*\'\(\)_] ) encoded+=$c ;;
        * ) encoded+=$(printf "%%%02X" "'$c") ;;

    esac
done

echo $encoded