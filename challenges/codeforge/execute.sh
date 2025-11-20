#!/bin/bash

cd src
docker run --rm -v "./":/src -w /src golang:1.17.2-alpine \
    sh -c 'GO111MODULE=off go build -o blade script.go'

cd ..
mkdir -p out
mv src/blade out