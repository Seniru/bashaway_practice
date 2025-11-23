#!/bin/bash

function isPrime() {
    local num="$1"

    if (( num < 2 )); then
        echo "Neither"
        return
    elif (( num == 2 )); then
        echo "Prime"
        return
    elif (( num % 2 == 0 )); then
        echo "Composite"
        return
    fi

    for (( i = 3; i * i <= num; i+=2 )); do
        if (( num % i == 0 )); then
            echo "Composite"
            return
        fi
    done

    echo "Prime"
}

isPrime "$1"
