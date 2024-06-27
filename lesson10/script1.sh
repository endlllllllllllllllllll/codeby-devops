#!/bin/bash

mkdir -p ~/myfolder

cd ~/myfolder || exit

echo "Добро пожаловать!" > file1.txt
echo "$(date)" >> file1.txt

touch file2.txt
chmod 777 file2.txt

head -c 20 /dev/urandom | base64 > file3.txt

touch file4.txt
touch file5.txt

cd -
