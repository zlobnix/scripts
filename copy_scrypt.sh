#!/bin/bash

SOURCE_DIR=/home/victor/playground
TARGET_DIR=/opt/foobar

files=( "${SOURCE_DIR}"/* )

total_files=${#files[@]}

for (( i=0; i<${total_files}; i++ )); do
  mv "${files[$i]}" "${TARGET_DIR}"
  echo -e "Перенесено $((${i} + 1)) из ${total_files} файлов. Осталось $((${total_files} - ${i} - 1)). Процент выполнения: $(( (${i} + 1)*100/${total_files} ))%"
done
