mkdir out
f=$(ls src)
gzip -c src/* > out/${f%.*}.gz