#!/bin/bash

str=$1
max=0
n=${#str}
maxC=${str:0:1}
currentC=${str:0:1}
count=0

for (( i = 0; i < n; i++ )); do
  c=${str:i:1}
  if [ $c = $currentC ]; then
    (( count++ ))
    if (( count > max )); then
      max=$count
      maxC=$c
    fi
  else
    count=1
    currentC=$c
  fi
done

echo "$maxC,$max"