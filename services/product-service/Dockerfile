FROM python:3.12-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копирование requirements.txt
COPY requirements.txt /app/

# Установка Python зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Копирование всего проекта
COPY . /app/

# Создание директории для баз данных
RUN mkdir -p /app/../databases

EXPOSE 8001

CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

