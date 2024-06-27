#!/bin/bash

# Константы
MY_FOLDER="$HOME/myfolder"
FILE1_CONTENT="Добро пожаловать!\n$(date)"
RANDOM_STRING_LENGTH=20

# Создание папки myfolder, если её нет
mkdir -p "$MY_FOLDER" || { echo "Failed to create directory"; exit 1; }

# Переход в папку myfolder или выход в случае ошибки
cd "$MY_FOLDER" || { echo "Failed to change directory"; exit 1; }

# Создание file1.txt и запись приветствия и текущей даты/времени
echo -e "$FILE1_CONTENT" > file1.txt || { echo "Failed to create file1.txt"; exit 1; }

# Создание пустого файла file2.txt
touch file2.txt || { echo "Failed to create file2.txt"; exit 1; }

# Установка прав доступа 777 для file2.txt
chmod 777 file2.txt || { echo "Failed to chmod file2.txt"; exit 1; }

# Создание file3.txt с одной строкой длиной 20 случайных символов
head -c "$RANDOM_STRING_LENGTH" /dev/urandom | base64 > file3.txt || { echo "Failed to create file3.txt"; exit 1; }

# Создание пустых файлов file4.txt и file5.txt
touch file4.txt || { echo "Failed to create file4.txt"; exit 1; }
touch file5.txt || { echo "Failed to create file5.txt"; exit 1; }

# Возврат в предыдущую директорию
cd - > /dev/null || exit
