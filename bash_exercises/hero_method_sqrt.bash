#!/bin/bash
int_rac () {
    e=1
    n=$1
    x=$2
    while (( x >= e )); do
      echo $x
      prex=$x
      x=$(((x + n / x) / 2))
      if ((prex == x)); then
        break
      fi
    done
    echo $x
}
int_rac "$1" "$2"