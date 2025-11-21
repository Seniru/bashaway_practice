#! /bin/bash

if [[ ! -d src ]]; then
    exit 0
fi

if [[ ! -f /usr/local/bin/yq ]]; then
    # Set your platform variables (adjust as needed)
    VERSION=v4.48.2
    PLATFORM=linux_amd64

    # Download compressed binary
    wget https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_${PLATFORM}.tar.gz -O - |\
      tar xz && sudo mv yq_${PLATFORM} /usr/local/bin/yq
fi

mkdir -p out
cd src
for file in *; do
    yq -o json "$file" > ../out/${file%.*}.json
done
cd ..