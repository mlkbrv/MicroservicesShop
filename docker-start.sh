#!/bin/bash

# Скрипт для запуска всех микросервисов через Docker

echo "🚀 Запуск Microservices Shop через Docker..."

# Проверка наличия Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не установлен. Пожалуйста, установите Docker Desktop."
    exit 1
fi

# Проверка наличия docker-compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose не установлен. Пожалуйста, установите docker-compose."
    exit 1
fi

# Создание директории для баз данных, если её нет
mkdir -p databases

# Запуск сервисов
echo "📦 Сборка и запуск контейнеров..."
docker-compose up --build -d

# Ожидание запуска сервисов
echo "⏳ Ожидание запуска сервисов..."
sleep 10

# Проверка статуса
echo "📊 Статус сервисов:"
docker-compose ps

echo ""
echo "✅ Сервисы запущены!"
echo ""
echo "Доступные сервисы:"
echo "  - API Gateway: http://localhost:8000"
echo "  - Product Service: http://localhost:8001"
echo "  - Cart Service: http://localhost:8002"
echo "  - Order Service: http://localhost:8003"
echo "  - User Service: http://localhost:8004"
echo ""
echo "Для просмотра логов: docker-compose logs -f"
echo "Для остановки: docker-compose down"

