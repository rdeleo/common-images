# PHP 7.0 Apache Container Image
#
# VERSION 0.0.2
FROM php:7.0-apache
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

## Extend PHP
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils\
    ## Zip extension
    && apt-get install -y --no-install-recommends zlib1g-dev \
    && docker-php-ext-install zip \
    ## Imap extension
    && apt-get install -y --no-install-recommends libc-client-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    ## Xsl extension
    && apt-get install -y --no-install-recommends libxslt-dev \
    && docker-php-ext-install xsl \
    ## Intl extension
    && apt-get install -y --no-install-recommends libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    ## Mcrypt
    && apt-get install -y --no-install-recommends libmcrypt-dev \
    ## gd  & other image extentions
    && apt-get install -y --no-install-recommends libpng-dev libfreetype6-dev \
       libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    ## Other extensions & database utils
    && apt-get install -y --no-install-recommends mysql-client \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    ## git, curl and supervisor
    && apt-get install -y --no-install-recommends git curl supervisor \
    ## Cron
    && apt-get install -y --no-install-recommends cron rsyslog \
    && rm -rf /etc/cron.* \
    && mkdir /var/log/cron && touch /var/log/cron/cron.log \
    ## Clean-up
    && rm -rf /var/lib/apt/lists/*

## Copy development php.ini
COPY containers/apache-php/common/conf/php.ini /usr/local/etc/php/php.ini

#Install redis extension
RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis

## Apache preparation
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && mkdir /etc/apache2/ssl \
    && mkdir /etc/apache2/templates \
    && mkdir /log \
    && chown www-data:www-data /log

COPY containers/apache-php/common/conf/apache-default-template.conf /etc/apache2/templates/apache-default-template.conf
COPY containers/apache-php/common/conf/apache-default-ssl-template.conf /etc/apache2/templates/apache-default-ssl-template.conf

## Supervisor log
RUN mkdir -p /var/log/supervisor