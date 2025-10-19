#!/bin/bash
movie() {
    bc << EOF
    scale=10

    card_price = $1
    ticket_price = $2
    rate = $3
    a = ticket_price
    b = ticket_price * rate
    times = 1

    while (a < (b + 500)) {
        a = a + ticket_price
        b = b + ticket_price * rate ^ times
        times = times + 1
        print b, "\n"
    }
    print times - 1
EOF

    
}

movie $1 $2 $3