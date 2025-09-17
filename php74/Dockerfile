FROM php:7.4-fpm-alpine

# Устанавливаем системные зависимости
RUN apk update && apk add --no-cache \
    libzip-dev \
    zip \
    unzip \
    mariadb-client \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev

# Устанавливаем PHP расширения
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql mysqli zip gd

# Включаем расширения
RUN docker-php-ext-enable pdo_mysql mysqli

# Устанавливаем composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Настраиваем права
RUN chown -R www-data:www-data /var/www