#!/bin/bash

# Получаю IP адрес сервера
server_ip=$(hostname -I | awk '{print $1}')

echo "Сканирую открытые порты на сервере $server_ip"

# Диапазон портов для сканирования
start_port=1
end_port=65535

# Проходимся по каждому порту в заданном диапазоне
for (( port=$start_port; port<=$end_port; port++ ))
do
    # Пытаемся установить соединение с портом
    (echo >/dev/tcp/$server_ip/$port) &>/dev/null

    # Проверяем код завершения последней команды (0 - успешно, не 0 - неуспешно)
    if [ $? -eq 0 ]; then
        echo "Порт $port открыт"
    fi
done
