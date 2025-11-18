mkdir out
cat src/* | jq -j -s add > out/merged.json