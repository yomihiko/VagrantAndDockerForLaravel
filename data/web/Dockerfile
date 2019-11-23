FROM php:7.2-apache

ARG PROJECTNAME="ProgressManagementTool"


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) zip
RUN curl -sS https://getcomposer.org/installer | php \
    && cp composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && mkdir /home/laravel \
    && groupadd -g 5555 laravel \
    && useradd -d /home/laravel -g 5555 laravel \
    && chown laravel:laravel /home/laravel \
    && chown laravel:laravel /var/www/html
RUN a2enmod rewrite
