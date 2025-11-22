#! /bin/bash

catapults=""
batallions=""

while [[ "$#" -gt 0 ]]; do
    arg="$1"
    if [[ $arg == "-c" ]]; then
        shift
        catapults="$1"
    elif [[ $arg == "-b" ]]; then
        shift
        while [[ -n $1 ]]; do
            batallions+=$(echo "$1 " | tr -d "'" )
            shift
        done
    else
        shift
    fi
done

if [[ -z $catapults || -z $batallions ]]; then
    echo Inputs not provided
    exit 0
fi

batallions=($(echo $batallions | tr " " "\n" | sort -n -r))
n=${#batallions[@]}
i=0
destroyed=0

while (( catapults > 0 && i < n )); do
    batallion=${batallions[i]}
    if (( catapults >= batallion )); then
        (( catapults -= batallion ))
        (( destroyed++ ))
    fi
    (( i+=1 ))
done

echo $destroyed