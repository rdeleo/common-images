# PHP behat container, from https://github.com/javanile/human-mink-extensio
#
# VERSION 0.0.1
FROM php:7.2-cli
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

# Allow composer to be used by r
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

## Install prestissimo
RUN /usr/bin/composer global require hirak/prestissimo