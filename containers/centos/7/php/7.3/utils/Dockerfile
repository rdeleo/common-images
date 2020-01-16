#########################################################
#                                                       #
# Centos:7.7 - Php:7.3 - Utils                          #
#                                                       #
#########################################################
FROM rdeleo/centos7-php7.3-cli:7.3.13
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /home/centos

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Allows root to run composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install prestissimo
RUN /usr/bin/composer global require hirak/prestissimo