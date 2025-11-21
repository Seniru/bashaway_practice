if [[ ! -d .git ]]; then
    git init
fi

mkdir -p out
touch out/commits.txt

cat > .git/hooks/commit-msg <<"EOF"
#! /bin/bash

message=$(cat $1)
echo $message >> out/commits.txt

EOF

chmod +x .git/hooks/commit-msg
