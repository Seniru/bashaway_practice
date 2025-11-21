#! /bin/bash

keys=""
script=""

function get_arg_value() {
    local arg=$1
    echo $arg | cut -d "=" -f2
}

while [[ "$#" -gt 0 ]]; do
    arg="$1"
    if [[ $arg =~ ^--keys=.* ]]; then
        keys=$(get_arg_value $1)
    elif [[ $arg =~ ^--script=.* ]]; then
        script=$(get_arg_value $1)
    fi
    shift
done

if [[ -z $keys || -z $script ]]; then
    echo "--keys or --script options not provided. Exitting"
    exit 0
fi

env_vars=$(echo $keys | tr "," " ")
for var in $env_vars; do
    if [[ -z ${!var} ]] then
        echo Access Denied
        exit 0
    fi
done

sh $script