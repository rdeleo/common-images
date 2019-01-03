# PHP 7.0 Apache Container Image - DEVELOPMENT
#
# VERSION 0.0.1
FROM eclipsehv/apache-php:7.0-prod
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

#Install xdebug
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

# Add xdebug init script
COPY ./containers/apache-php/common/dev/init_xdebug.sh /usr/bin/init_xdebug
RUN chmod +x /usr/bin/init_xdebug