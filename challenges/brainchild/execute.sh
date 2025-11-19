#!/bin/bash

cat > git-clone-gh-org <<'EOF'
#!/bin/bash

org=$1
output_dir=$2

echo $org
echo $output_dir

mkdir -p $output_dir

urls=$(
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/orgs/$org/repos?per_page=100" | jq .[].html_url
)

cd $output_dir

for url in $urls; do
    git clone ${url:1:-1}
done

cd ..
EOF

chmod +x git-clone-gh-org

sudo rm /usr/bin/git-clone-gh-org
sudo ln -s "$(pwd)/git-clone-gh-org" /usr/bin/git-clone-gh-org
