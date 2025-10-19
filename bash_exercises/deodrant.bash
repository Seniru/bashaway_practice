#!/bin/bash
evaporator () {
    content=$1
    perday=$2
    threshold_percentage=$3
    bc <<EOF
        scale=10
        days=0
        content = $content
        threshold = content * ($threshold_percentage / 100)
        while ( content > threshold ) {
            content = content - (content * ($perday / 100.0))
            days = days + 1
        }
        print days
EOF
    
}

evaporator "$1" "$2" "$3"