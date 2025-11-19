o=$(cat src/* | jq "del(.$1)")
echo $o > src/courtroom.json
