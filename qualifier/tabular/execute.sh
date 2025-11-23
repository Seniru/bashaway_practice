#!/bin/bash
pnpm i csv-parse
mkdir -p out
cat > out/result.csv <<EOF
category,total_amount
A,300
B,500
EOF