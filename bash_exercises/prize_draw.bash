#!/bin/bash

score() {
  local name=$1
  local weight=$2
  local len=${#name}
  name=$(echo $name | tr "[:upper:]" "[:lower:]")
  alphabetical_score=0
  for (( i=0; i<len; i++ )); do
    local c="${name:i:1}"
    local rank=$(( $(printf "%d" "'$c") - 96 ))
    (( alphabetical_score += rank ))
  done
  echo $(( (len + alphabetical_score) * 2  ))
}

rank () {
    local names=( $(echo $1 | tr "," ' ') )
    local weights=( $(echo $2 | tr "," ' ') )
    local n=${#names[@]}
    
    for i in $(seq 0 $(( n-1 ))); do
      name=${names[i]}
      weight=${weights[i]}
      echo $(score $name $weight) $name
    done
}

ranks=$(rank "$1" "$2")
echo "$ranks" | sort | sed -n "$3p" | cut -d " " -f2
