#!/bin/bash

# Проверка на root права
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите от имени root"
  exit
fi

echo "Обновление пакетов и установка Git/Docker..."
apt-get update -y
apt-get install -y git curl

# Установка Docker, если не установлен
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com | sh
fi

echo "Клонирование репозитория..."
cd /root
if [ -d "3xui" ]; then
    echo "Папка 3xui уже существует, обновляем..."
    cd 3xui
    git pull
else
    git clone https://github.com/kyaru-b/3xui.git
    cd 3xui
fi

echo "Запуск контейнера..."
docker compose up -d --build

echo "Готово! 3x-ui запущен."
