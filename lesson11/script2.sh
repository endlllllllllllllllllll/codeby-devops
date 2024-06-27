#!/bin/bash

# Константы
MY_FOLDER="$HOME/myfolder"

# Переход в папку myfolder или выход в случае ошибки
cd "$MY_FOLDER" || { echo "Failed to change directory"; exit 1; }

# Подсчет количества файлов в папке
file_count=$(find . -maxdepth 1 -type f | wc -l)
echo "Количество файлов в папке: $file_count"

# Изменение прав доступа второго файла на 664
second_file=$(find . -maxdepth 1 -type f | sed -n '2p')
chmod 664 "$second_file" || { echo "Failed to chmod $second_file"; exit 1; }

# Удаление пустых файлов
find . -type f -empty -delete || { echo "Failed to delete empty files"; exit 1; }

# Сохранение только первой строки в каждом файле, где больше одной строки
for file in *; do
    if [ "$(wc -l < "$file")" -gt 1 ]; then
        head -n 1 "$file" > "$file.tmp" || { echo "Failed to create temporary file for $file"; exit 1; }
        mv "$file.tmp" "$file" || { echo "Failed to move temporary file for $file"; exit 1; }
    fi
done

# Возврат в предыдущую директорию
cd - > /dev/null || exit
