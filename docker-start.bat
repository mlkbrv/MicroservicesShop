@echo off
REM Скрипт для запуска всех микросервисов через Docker (Windows)

echo 🚀 Запуск Microservices Shop через Docker...

REM Проверка наличия Docker
where docker >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker не установлен. Пожалуйста, установите Docker Desktop.
    exit /b 1
)

REM Проверка наличия docker-compose
where docker-compose >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ docker-compose не установлен. Пожалуйста, установите docker-compose.
    exit /b 1
)

REM Создание директории для баз данных, если её нет
if not exist "databases" mkdir databases

REM Запуск сервисов
echo 📦 Сборка и запуск контейнеров...
docker-compose up --build -d

REM Ожидание запуска сервисов
echo ⏳ Ожидание запуска сервисов...
timeout /t 10 /nobreak >nul

REM Проверка статуса
echo 📊 Статус сервисов:
docker-compose ps

echo.
echo ✅ Сервисы запущены!
echo.
echo Доступные сервисы:
echo   - API Gateway: http://localhost:8000
echo   - Product Service: http://localhost:8001
echo   - Cart Service: http://localhost:8002
echo   - Order Service: http://localhost:8003
echo   - User Service: http://localhost:8004
echo.
echo Для просмотра логов: docker-compose logs -f
echo Для остановки: docker-compose down

pause

