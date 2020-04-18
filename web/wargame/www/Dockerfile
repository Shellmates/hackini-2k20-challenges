FROM php:7.0-apache
RUN apt-get update && apt-get install -y iputils-ping
RUN docker-php-ext-install mysqli
COPY 000-default.conf /etc/apache2/sites-enabled/
EXPOSE 80
