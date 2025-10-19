#!/usr/bin/env bash

balancedNum ()
{
    local -- number=$1
    n=${#number}
    mid=$((n/2))

    if (( n % 2 == 0)); then
        left=${number:0:((mid - 1))}
        right=${number:(mid + 1)}
    else
        left=${number:0:mid}
        right=${number:((mid + 1))}
    fi

    leftsum=0
    rightsum=0

    for i in $(seq 0 ${#left}); do
        c=${left:i:1}
        ((leftsum += c))
    done

    for i in $(seq 0 ${#right}); do
        c=${right:i:1}
        ((rightsum += c))
    done

    echo $left $right $leftsum $rightsum

    if ((leftsum == rightsum)); then
        echo "Balanced"
    else
        echo "Not Balanced"
    fi

}

balancedNum $1