#!/bin/bash

dir=$1

for file in $(ls -1 $dir)
do
    echo $dir/$file
    stem="${file%.*}"
    ext="${file##*.}"
    convert $dir/$file -resize 33% $dir/${stem}_resized.$ext
done