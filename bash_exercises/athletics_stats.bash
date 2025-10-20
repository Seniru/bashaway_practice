#!/bin/bash

function to_seconds() {
    local str=$1
    local h=$(echo $str | cut -d "|" -f1)
    local m=$(echo $str | cut -d "|" -f2)
    local s=$(echo $str | cut -d "|" -f3)
    echo $(( h * 3600 + m * 60 + s ))
}

function to_time() {
    local secs=$1
    printf "%02d|%02d|%02d\n" $(( $secs / (60 * 60) )) $(( ($secs % (3600)) / 60 )) $(( ($secs % 60) ))
}

function median() {
    local l=("$@")
    local n=${#l[@]}

    if (( n % 2 == 0 )); then
        local mid1=${l[$(( n/2 - 1 ))]}
        local mid2=${l[$(( n/2 ))]}
        echo $(( (mid1 + mid2) / 2 ))
    else
        echo ${l[$(( n/2 ))]}
    fi
}


function stat () {
    local times=($(echo $1 | tr -d ","))
    local in_seconds=()

    local n=${#times[@]}
    local sum=0
    for time in ${times[@]}; do
        secs=$(to_seconds $time)
        in_seconds+=($secs)
        (( sum+=secs))
    done
    local sorted=($(echo ${in_seconds[@]} | tr " " '\n' | sort -n))
    local min=${sorted[0]}
    local max=${sorted[-1]}
    local range=$(( max - min ))
    local avg=$(( sum / n))
    local mdn=$(median ${sorted[@]})

    printf "Range: %s Average: %s Median: %s\n" $(to_time $range) $(to_time $avg) $(to_time $mdn)
}

stat "$1"