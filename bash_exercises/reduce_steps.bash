#!/bin/bash

gcdi() {
    if (( $1 == $2)); then
      echo $1
    else
      min=$(mini $1 $2)
      max=$(maxi $1 $2)
      gcdi $((max - min)) $min
    fi
}


lcmu() {
    gcd=$(gcdi $1 $2)
    abs=$(echo $(( $1 * $2 )) | tr -d "-")
    echo $(( abs / gcd ))
}

som() {
    echo $(( $1 + $2 ))
}

maxi() {
    if (( $1 > $2 )); then
      echo $1
    else
      echo $2
    fi
}

mini() {
    if (( $1 < $2)); then
      echo $1
    else
      echo $2
    fi
}

reduce() {
    f=$1
    arr=($2)
    acc=$3
    for i in $(seq 0 $(( ${#arr[@]} - 1))); do
        acc=$($f $acc ${arr[i]})
    done
    echo $acc
}

operArray() {
    echo $($1 $2 $3)
}


reduce som "1 2 3 4 5" 0
#operArray "$1" "$2" $3