#########################################################
#                                                       #
# Debian:10 - Php:7.2 - Utils                           #
#                                                       #
#########################################################
FROM rdeleo/debian10-php7.2-cli:7.2.28
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Allows root to run composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install prestissimo
RUN /usr/bin/composer global require hirak/prestissimo