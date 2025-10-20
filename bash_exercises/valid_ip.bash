#!/bin/bash

adr="$1"

o=()

for i in {1..4}; do
  o[i]=$(echo $adr | cut -d "." -f$i)
  if [[
    -z ${o[i]}
    || ! ${o[i]} =~ ^[1-9]?[1-9]?[0-9]$
    || ${o[i]} -lt 0
    || ${o[i]} -gt 255
    ]]; then
    echo False
    exit
  fi
done

if (( ${#o[@]} == 4 )); then
  echo True
else
  echo False
fi