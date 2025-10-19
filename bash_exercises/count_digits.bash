#!/bin/bash
nbDig() {
    n=$1
    d=$2
    res=""
    for i in $(seq 0 $n); do
        res+=$((i**2))
    done
    echo $res | grep -o $d | wc -l
}
nbDig $1 $2