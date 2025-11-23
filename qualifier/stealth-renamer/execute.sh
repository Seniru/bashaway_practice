find ./src -type f -regex ".*/${1#^}"|while read f;do b=$(basename "$f");t="${b%.*}_renamed.${b##*.}";touch "src/$t";rm "$f";done
