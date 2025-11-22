

rm -rf src
git clone https://github.com/sliit-foss/bashaway-ui.git src


# Write your code here
cd out
logs=$(git log --pretty="%H %an %ae")
while IFS= read -r line; do
    commithash=$(echo $line | cut -d " " -f1)
    authorname=$(echo $line | cut -d " " -f2)
    authoremail=$(echo $line | cut -d " " -f3)

    if [[ $authorname == "github-actions[bot]" ]]; then
        git commit -c $commithash --amend --author="github-actions <$authoremail>" --no-edit

    fi
done <<< "$logs"