function reduce() {
    local predicate=$1
    local res="$2"
    local arr=(${@:3})
    local n=${#arr[@]}

    for i in $(seq 0 $(( n - 1 ))); do
        local v=${arr[i]}
        res=$($predicate "$res" "$v" $i)
    done

    echo $res
}

# Example usage

# numbers=(1 2 3 4 5)
# function add() {
#     echo $(( $1 + $2 ))
# }

# sum=($(reduce add 0 ${numbers[@]}))
# or sum=($(reduce add 1 2 3 4 5))
# echo ${sum[@]}

reduce $1 $2 $3
