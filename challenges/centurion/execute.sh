if [ -z "$1" ]; then
    exit 0
fi

branches=$(git --no-pager  branch --format="%(refname:short)" --list "$1*")
for branch in $branches; do
    git branch -d $branch
done
