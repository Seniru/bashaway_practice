#! /bin/bash

# A random count of csv files will be generated within the src directory once the tests are run.

# Write your code here

if [ ! -d src ]; then
    exit 0
fi


mkdir -p out
rm out/*
sort -r -n -t ',' -k 2 -o out/tmp.csv src/*
echo "Item,Value(SilverSovereigns)"> out/merged-scrolls.csv

while IFS= read -r line; do
    name=$(echo $line | cut -d "," -f1)
    value=$(echo $line | cut -d "," -f2)

    if [[ $value =~ Value\(.*\) ]]; then
        continue
    fi

    echo $name,$(bc <<< "scale=2; $value * 178" | xargs printf "%.2f") >> out/merged-scrolls.csv
done < out/tmp.csv
