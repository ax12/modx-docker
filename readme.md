# Docker MODX 2.8 Environment

PowerShell команды для управления Docker-окружением MODX 2.8

## 📋 Основные команды

| Команда | Описание |
|---------|----------|
| `cd C:\developing\docker\modx28\docker-modx` | Перейти в папку проекта |
| `docker-compose up -d` | Запустить все контейнеры в фоновом режиме |
| `docker-compose down` | Остановить и удалить все контейнеры |
| `docker-compose ps` | Показать статус контейнеров |
| `docker-compose logs` | Показать логи всех контейнеров |
| `docker-compose logs nginx` | Логи только nginx |
| `docker-compose logs php` | Логи только PHP |
| `docker-compose logs mysql` | Логи только MySQL |
| `docker-compose restart` | Перезапустить все контейнеры |
| `docker-compose restart nginx` | Перезапустить только nginx |

## 🗄️ Команды для MySQL

| Команда | Описание |
|---------|----------|
| `docker-compose exec mysql mysql -u root -prootpassword` | Подключиться к MySQL как root |
| `docker-compose exec mysql mysql -u modx_user -pmodx_password modx_dev` | Подключиться к базе modx_dev |
| `docker-compose exec mysql mysql -u root -prootpassword -e "SHOW DATABASES;"` | Показать все базы данных |
| `docker-compose exec mysql mysql -u root -prootpassword -e "DROP DATABASE modx_dev; CREATE DATABASE modx_dev CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"` | Пересоздать базу modx_dev |

## 🐘 Команды для PHP

| Команда | Описание |
|---------|----------|
| `docker-compose exec php php -m` | Показать установленные PHP модули |
| `docker-compose exec php php -m | Select-String "mysql"` | Проверить mysql модули |
| `docker-compose exec php php -m | Select-String "pdo"` | Проверить PDO модули |
| `docker-compose exec php chown -R www-data:www-data /var/www` | Исправить права на файлы |

## 📁 Управление файлами

| Команда | Описание |
|---------|----------|
| `docker-compose exec php ls -la /var/www/dev.local` | Просмотр файлов сайта |
| `docker-compose exec php rm -rf /var/www/dev.local/core/cache/*` | Очистить кэш MODX |
| `docker-compose cp ./www/dev.local/. php:/var/www/dev.local/` | Копировать файлы в контейнер |

## 🎯 Утилиты

| Команда | Описание |
|---------|----------|
| `docker-compose exec nginx nginx -t` | Проверить конфигурацию nginx |
| `docker-compose exec nginx nginx -s reload` | Перезагрузить nginx |
| `docker-compose build php` | Пересобрать PHP контейнер |
| `docker-compose exec php composer install` | Установить Composer зависимости |

## 🔧 Создание структуры проекта

```powershell
# Создать структуру папок
New-Item -ItemType Directory -Path "docker-modx", "docker-modx/nginx", "docker-modx/nginx/sites", "docker-modx/php", "docker-modx/mysql", "docker-modx/www", "docker-modx/www/dev.local", "docker-modx/www/proda.local" -Force

# Docker MODX 2.8 Environment

PowerShell команды для управления Docker-окружением MODX 2.8

## 📋 Основные команды

| Команда | Описание |
|---------|----------|
| `cd C:\developing\docker\modx28\docker-modx` | Перейти в папку проекта |
| `docker-compose up -d` | Запустить все контейнеры в фоновом режиме |
| `docker-compose down` | Остановить и удалить все контейнеры |
| `docker-compose ps` | Показать статус контейнеров |
| `docker-compose logs` | Показать логи всех контейнеров |
| `docker-compose logs nginx` | Логи только nginx |
| `docker-compose logs php` | Логи только PHP |
| `docker-compose logs mysql` | Логи только MySQL |
| `docker-compose restart` | Перезапустить все контейнеры |
| `docker-compose restart nginx` | Перезапустить только nginx |

## 🗄️ Команды для MySQL

| Команда | Описание |
|---------|----------|
| `docker-compose exec mysql mysql -u root -prootpassword` | Подключиться к MySQL как root |
| `docker-compose exec mysql mysql -u modx_user -pmodx_password modx_dev` | Подключиться к базе modx_dev |
| `docker-compose exec mysql mysql -u root -prootpassword -e "SHOW DATABASES;"` | Показать все базы данных |
| `docker-compose exec mysql mysql -u root -prootpassword -e "DROP DATABASE modx_dev; CREATE DATABASE modx_dev CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"` | Пересоздать базу modx_dev |

## 🐘 Команды для PHP

| Команда | Описание |
|---------|----------|
| `docker-compose exec php php -m` | Показать установленные PHP модули |
| `docker-compose exec php php -m | Select-String "mysql"` | Проверить mysql модули |
| `docker-compose exec php php -m | Select-String "pdo"` | Проверить PDO модули |
| `docker-compose exec php chown -R www-data:www-data /var/www` | Исправить права на файлы |

## 📁 Управление файлами

| Команда | Описание |
|---------|----------|
| `docker-compose exec php ls -la /var/www/dev.local` | Просмотр файлов сайта |
| `docker-compose exec php rm -rf /var/www/dev.local/core/cache/*` | Очистить кэш MODX |
| `docker-compose cp ./www/dev.local/. php:/var/www/dev.local/` | Копировать файлы в контейнер |

## 🎯 Утилиты

| Команда | Описание |
|---------|----------|
| `docker-compose exec nginx nginx -t` | Проверить конфигурацию nginx |
| `docker-compose exec nginx nginx -s reload` | Перезагрузить nginx |
| `docker-compose build php` | Пересобрать PHP контейнер |
| `docker-compose exec php composer install` | Установить Composer зависимости |

## 🔧 Создание структуры проекта

```powershell
# Создать структуру папок
New-Item -ItemType Directory -Path "docker-modx", "docker-modx/nginx", "docker-modx/nginx/sites", "docker-modx/php", "docker-modx/mysql", "docker-modx/www", "docker-modx/www/dev.local", "docker-modx/www/proda.local" -Force```

