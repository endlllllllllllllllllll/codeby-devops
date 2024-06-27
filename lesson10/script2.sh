#!/bin/bash

cd ~/myfolder || exit

file_count=$(ls -1 | wc -l)

echo "Количество файлов в папке: $file_count"

chmod 664 $(ls | sed -n '2p')

find . -type f -empty -delete

for file in *; do
    if [ "$(wc -l < "$file")" -gt 1 ]; then
        head -n 1 "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
    fi
done

cd -
