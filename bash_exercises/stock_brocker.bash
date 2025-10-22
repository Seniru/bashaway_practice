#!/bin/bash

function parse_order() {
    company=$1
    quantity=$2
    price=$3
    type=$4

    if [[ 
        -z $company ||
        -z $quantity ||
        -z $price ||
        -z $type || 
        ! $quantity =~ ^[0-9]+$ ||
        ! $price =~ ^[0-9]+\.[0-9]+$
    ]]; then
        echo "false 0 0"
        return 1
    else
        case $type in 
            'B') 
                echo "true $(bc <<< "scale=5; $price * $quantity") 0"
                ;;
            'S')
                echo "true 0 $(bc <<< "scale=5; $price * $quantity")"
            ;;
            '*')
                echo "false 0 0"
                return 1
        esac
        return 0
    fi
}

function balance_statement() {
    local orders=()
    local bad=()
    local buy=0
    local sell=0
    IFS="," read -r -a orders <<< "$1"
    
    for order in "${orders[@]}"; do
        local parsed_order=($(parse_order $order))
        if [[ $parsed_order = "false" ]]; then
            bad+=("$order")
        else
            local bValue=${parsed_order[1]}
            local sValue=${parsed_order[2]}
            buy=$( bc <<< "scale=5; $buy + $bValue" )
            sell=$( bc <<< "scale=5; $sell + $sValue" )
        fi
    done   

    echo $buy $sell
    buy=$(awk -v n="$buy" 'BEGIN {f=int(n); print (n-f>0.5?f+1:f)}' | cut -d "." -f1)
    sell=$(awk -v n="$sell" 'BEGIN {f=int(n); print (n-f>0.5?f+1:f)}' | cut -d "." -f1)
    echo -n "Buy: $buy Sell: $sell"
    if [[ ${#bad[@]} > 0 ]]; then
        echo "; Badly formed ${#bad[@]}: $(printf '%s ;' "${bad[@]}")"
    fi
}

balance_statement "$1"