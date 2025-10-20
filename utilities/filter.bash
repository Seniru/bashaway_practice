#!/bin/bash

function filter() {
    local predicate=$1
    local arr=(${@:2})
    local n=${#arr[@]}
    local res=()

    for i in $(seq 0 $(( n - 1 ))); do
        local v=${arr[i]}
        if $predicate $v $i; then
            res+=($v)
        fi
    done

    echo ${res[@]}
}

# Example usage

# numbers=(1 2 3 4 5)
# function is_even() {
#     local n=$1
#     (( n % 2 == 0 ))
#     return
# }

# even=($(filter is_even ${numbers[@]}))
# or even=($(filter is_even 1 2 3 4 5))
# echo ${even[@]}

filter $1 $2
