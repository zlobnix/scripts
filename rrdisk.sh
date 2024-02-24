#!/bin/bash
# Скрипт перезаписи диска, для очистки данных
# Создаю файл...
file_path="/home/username/my_file"

echo "Создание  файла..."
dd if=/dev/urandom of=$file_path bs=1M count=102400 || { echo "Ошибка при создании файла"; exit 1; }
echo "Файл успешно создан."

echo "Проверь, что выбранный файл верный: $file_path"
read -p "Продолжить? (y/n): " confirm

if [ "$confirm" != "y" ]; then
  echo "Отменено пользователем." >&2
  exit 1
fi

# Запись случайных данных
echo "Начинаю запись случайных данных..."
if shred -v -z -n 35 -u $file_path; then
   echo "Запись данных завершена успешно."
else
   echo "Ошибка при записи данных" >&2; 
   exit 1;
fi
