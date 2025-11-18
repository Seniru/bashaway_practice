#!/bin/bash
for i in $(seq 0 $2 ${#1})
do echo ${1:i:$2}
done