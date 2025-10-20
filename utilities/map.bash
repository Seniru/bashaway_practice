#!/bin/bash

function map() {
    local predicate=$1
    local arr=(${@:2})
    local n=${#arr[@]}
    local res=()

    for i in $(seq 0 $(( $n - 1 ))); do
        local v=${arr[i]}
        res+=($($predicate "$v" $i))
    done

    echo ${res[@]}
}


# Example usage
# numbers=(1 2 3 4 5)
# function square() {
#     echo $(( $1 ** 2 ))
# }

# squared=($(map square ${numbers[@]}))
# or squared =($(map square 1 2 3 4 5))
# echo ${squared[@]}

map $1 $2

