#!/bin/bash

parts() {
    s=$1
    from=$2
    to=$3
    if (( $from <= $to )); then
        fields=$(seq $from $to | paste -sd ',')
        echo $s | cut -d " " -f$fields
    fi
}

partlist() {
    words=($1)
    n=$((${#words[@]}))
    s=$1
    for i in $(seq 1 $(($n - 1))); do
        local next_i=$(($i + 1))
        echo -n "($(parts "$s" 1 $i),$(parts "$s" $next_i $n))"
    done
    echo
}

parts "$1" 6 5
partlist "$1"
