#!/bin/bash

rm -rf out
mkdir out

chaos=$(cat src/*)
paths=($(echo $chaos | jq '
path(.. | select(type=="string")) | join(".")
'
))

n=${#paths[@]}
echo $(
  echo {
  for (( i = 0; i < n; i++ )); do
    path=${paths[i]}
    path=${path:1:-1}
    echo -n "    \"$path\": $(echo $chaos | jq .$path)"
    if (( i < n - 1 )); then
      echo ,
    else
      echo
    fi
  done
  echo }
) > out/transformed.json
