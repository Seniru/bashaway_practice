#!/bin/bash
nbYear() {
    p0=$1
    percent=$2
    aug=$3
    p=$4
    
    bc << EOF
    scale=10

    p = $p0
    years = 0
    while (p < $p) {
        p = p + $aug + ((p * ($percent / 100)) / 1)
        years = years + 1
    }
    print years
EOF
}

nbYear $1 $2 $3 $4