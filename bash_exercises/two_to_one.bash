#!/bin/bash
longest () {
    a=$1
    b=$2
    res=""
    for i in $(seq 0 $((${#a} - 1))); do
        c=${a:i:1}
        res+="$c"$'\n'
    done
    for i in $(seq 0 $((${#b} - 1))); do
        c=${b:i:1}
        res+="$c"$'\n'
    done
    echo "$res" | sort | uniq | tr -d '\n[:blank:]'
}
longest "$1" "$2"