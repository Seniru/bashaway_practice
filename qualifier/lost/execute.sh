#!/bin/bash

if [[ ! -d src ]]; then
    exit 0
fi

mkdir -p out
yq -o json src/* > out/output.json