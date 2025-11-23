#!/bin/bash
if [[ ! -d src ]]; then
    exit 0
fi

mkdir -p out
yq -o yaml 'sort_keys(..)'  src/* > out/transformed.yaml
