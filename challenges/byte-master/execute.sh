#! /bin/bash

# A random count of files will be generated within the src directory once the tests are run.

# Write your code here

count=0

for file in src/*; do
    contents=$(cat $file)
    size=${#contents}
    (( count+=size ))
done

echo $count