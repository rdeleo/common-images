# PHP behat container, from https://github.com/javanile/human-mink-extensio
#
# VERSION 0.0.1
FROM php:7.2-cli
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update \
 && apt-get install --no-install-recommends -y git unzip \
 && docker-php-ext-install mysqli pdo pdo_mysql \
 && rm -rf /var/lib/apt/lists/*

## Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

WORKDIR /app