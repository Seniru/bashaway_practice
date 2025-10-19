#!/bin/bash

dad_years_old=$1
son_years_old=$2

#implement me
difference=$(( $dad_years_old - $son_years_old ))
i=0

while (( i < 100 && i * 2 != i + difference )); do
  ((i++))
done

echo $i
exit