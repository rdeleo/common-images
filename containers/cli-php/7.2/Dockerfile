# PHP behat container, from https://github.com/javanile/human-mink-extensio
#
# VERSION 0.0.1
FROM php:7.2-cli
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

ENV COMPOSER_ALLOW_SUPERUSER=1

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
    ## git, curl and unzip
    && apt-get install -y --no-install-recommends git curl unzip \
    ## Clean-up
    && rm -rf /var/lib/apt/lists/*

## Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data && \
    mkdir /app && \
    chown -R www-data:www-data /app && \
    chown -R www-data:www-data /var/www

USER www-data:www-data

WORKDIR /app

## Install prestissimo
RUN /usr/bin/composer global require hirak/prestissimo