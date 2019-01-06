# PHP 7.2 Apache Container Image - DEVELOPMENT
#
# VERSION 0.0.1
FROM eclipsehv/apache-php:7.2-prod
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

#Install xdebug
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

# Add xdebug init script and dev docker-entrypoint
COPY containers/apache-php/common/bin/dev/init-xdebug.sh /usr/bin/init-xdebug
COPY containers/apache-php/common/bin/dev/docker-entrypoint.sh /usr/bin/docker-entrypoint

RUN chmod +x /usr/bin/init-xdebug && \
    chmod +x /usr/bin/docker-entrypoint

# Define default command
CMD ["docker-entrypoint"]