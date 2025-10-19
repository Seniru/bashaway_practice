#!/bin/bash
longestConsec() {
    strarr=($1)
    k=$2
    n=${#strarr[@]}
    max=0
    max_i=0
    
    if (( n == 0 || k > n || k <= 0)); then
      echo ""
    else
      for i in $(seq 0 $n); do
        local sum=0
        for j in $(seq $i $((i + k - 1))); do
          str=${strarr[j]}
          (( sum+=${#str} ))
        done
        if (( sum > max )); then
          max=$sum
          max_i=$i
        fi
      done
      echo ${strarr[@]:max_i:k} | tr -d " "
    fi
}
longestConsec "$1" $2
