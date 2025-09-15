Инструкция по добавлению нового сайта
📋 Подготовка
1. Добавление домена в hosts файл
   powershell
# Открыть hosts файл в блокноте (требует прав администратора)
notepad C:\Windows\System32\drivers\etc\hosts

# Добавить строку:
127.0.0.1 newsite.local
2. Создание папки для сайта
   powershell
# Перейти в папку проекта
cd C:\developing\docker\modx28\docker-modx

# Создать папку для нового сайта
New-Item -ItemType Directory -Path "www/newsite.local" -Force
🛠️ Автоматическое добавление (рекомендуется)
Использование скрипта add-site.sh
powershell
# Перейти в папку проекта
cd C:\developing\docker\modx28\docker-modx

# Дать права на выполнение скрипта (если используете Git Bash/WSL)
chmod +x add-site.sh

# Запустить скрипт для добавления сайта
./add-site.sh newsite.local
Скрипт автоматически выполнит:

Создание конфига nginx

Создание папки сайта

Добавление в hosts файл

Создание базы данных

Перезагрузку nginx

📝 Ручное добавление
1. Создание конфигурации nginx
   Создайте файл nginx/sites/newsite.local.conf:

nginx
server {
listen 80;
server_name newsite.local;
root /var/www/newsite.local;
index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ @modx;
    }

    location @modx {
        rewrite ^/(.*)$ /index.php?q=$1 last;
    }

    location ~ \.php$ {
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize=50M \n post_max_size=50M";
    }

    location ~ /\.ht {
        deny all;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
2. Создание базы данных
   powershell
# Создать базу данных для нового сайта
docker-compose exec mysql mysql -u root -prootpassword -e "CREATE DATABASE modx_newsite CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Дать права пользователю modx_user
docker-compose exec mysql mysql -u root -prootpassword -e "GRANT ALL PRIVILEGES ON modx_newsite.* TO 'modx_user'@'%'; FLUSH PRIVILEGES;"
3. Перезагрузка nginx
   powershell
# Проверить конфигурацию
docker-compose exec nginx nginx -t

# Перезагрузить nginx
docker-compose exec nginx nginx -s reload

# Или перезапустить контейнер
docker-compose restart nginx
🚀 Установка MODX на новый сайт
1. Подготовка файлов
   Скопируйте файлы MODX в папку сайта:

powershell
# Скопировать файлы MODX в папку нового сайта
# (предполагая, что файлы MODX находятся в папке modx_files)
Copy-Item -Path ".\modx_files\*" -Destination ".\www\newsite.local\" -Recurse
2. Установка через браузер
   Откройте в браузере: http://newsite.local/setup/

Следуйте инструкциям установщика

Важные настройки базы данных:

Тип БД: mysql

Сервер БД: mysql (имя контейнера)

Пользователь: modx_user

Пароль: modx_password

База данных: modx_newsite

Кодировка: utf8mb4_unicode_ci

3. Проверка установки
   powershell
# Проверить доступность сайта
curl http://newsite.local

# Проверить логи
docker-compose logs nginx | Select-String "newsite.local"
🔧 Дополнительные команды
Просмотр созданных сайтов
powershell
# Показать все конфиги nginx
Get-ChildItem -Path ".\nginx\sites\"

# Показать все папки сайтов
Get-ChildItem -Path ".\www\"

# Показать все базы данных
docker-compose exec mysql mysql -u root -prootpassword -e "SHOW DATABASES LIKE 'modx_%';"
Удаление сайта
powershell
# Удалить конфиг nginx
Remove-Item -Path ".\nginx\sites\newsite.local.conf"

# Удалить папку сайта
Remove-Item -Path ".\www\newsite.local\" -Recurse -Force

# Удалить базу данных
docker-compose exec mysql mysql -u root -prootpassword -e "DROP DATABASE modx_newsite;"

# Убрать из hosts файла (вручную)
# Удалить строку: 127.0.0.1 newsite.local

# Перезагрузить nginx
docker-compose restart nginx
📊 Проверка работы
После добавления сайта проверьте:

Доступность сайта:

powershell
curl -I http://newsite.local
Логи nginx:

powershell
docker-compose logs nginx | Select-String "newsite.local"
Базу данных:

powershell
docker-compose exec mysql mysql -u modx_user -pmodx_password modx_newsite -e "SHOW TABLES;"
Файлы сайта:

powershell
docker-compose exec php ls -la /var/www/newsite.local
⚠️ Частые проблемы
Сайт не открывается
Проверьте hosts файл

Проверьте конфиг nginx на ошибки:

powershell
docker-compose exec nginx nginx -t
Ошибка базы данных
Проверьте создана ли база:

powershell
docker-compose exec mysql mysql -u root -prootpassword -e "SHOW DATABASES LIKE 'modx_%';"
Ошибки прав доступа
powershell
# Исправить права файлов
docker-compose exec php chown -R www-data:www-data /var/www/newsite.local
docker-compose exec php chmod -R 755 /var/www/newsite.local