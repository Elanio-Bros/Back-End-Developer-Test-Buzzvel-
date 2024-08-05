FROM php:8.0-apache

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y libzip-dev \
			zip \ 
			git \
			libpq-dev
RUN docker-php-ext-install zip pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY . /var/www/html

RUN composer install