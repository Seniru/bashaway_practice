#!/bin/bash

shopt -s globstar

rm -rf out
rm -rf decoy
rm -rf test-extract-tar
rm -rf test-extract-zip

mkdir -p out

find src -type f -not -path "*/.*" -exec sha256sum {} \; > out/manifest.txt

zip -j -P bashaway2025 backup.zip src/**/*
mv backup.zip out

(cd src && tar -czf ../backup.tar.gz --exclude='**/.*' .)
mv backup.tar.gz out
