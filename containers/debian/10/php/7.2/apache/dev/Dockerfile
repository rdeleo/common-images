#########################################################
#                                                       #
# Debian:10 - Php:7.2 - Apache - Dev                    #
#                                                       #
#########################################################
FROM php:7.2.32-apache-buster
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

ARG XDEBUG_INI=xdebug.ini
ARG TEMPLATES_DIR=/var/www/templates
ARG CONTAINER_DIR=/containers/debian/10/php/7.2/apache/dev

ENV DEBIAN_FRONTEND noninteractive

# Upgrade and install base packages
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
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
    && apt-get install -y --no-install-recommends \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    ## git, curl and unzip
    && apt-get install -y --no-install-recommends git curl unzip \
    ## Clean-up
    && rm -rf /var/lib/apt/lists/*

#Install redis extension
#
# 2019-01-31 - PECL FIX - Install redis from source
# 2020-01-15 - UPDATE   - Updated to phpredis 5.1.1
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.1.1.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir /usr/src/php \
    && mkdir /usr/src/php/ext \
    && mv phpredis-5.1.1 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

#Install xdebug
RUN pecl install xdebug-2.9.0 \
    && docker-php-ext-enable xdebug

# Make template directory
RUN mkdir $TEMPLATES_DIR

# Add placeholders xdebug.ini file
RUN touch $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.idekey = __XDEBUG_ID_KEY__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.default_enable = __XDEBUG_DEFAULT_ENABLE__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_log = __XDEBUG_REMOTE_LOG__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_enable = __XDEBUG_REMOTE_ENABLE__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_autostart = __XDEBUG_REMOTE_AUTOSTART__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_connect_back = __XDEBUG_REMOTE_CONNECT_BACK__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_port = __XDEBUG_REMOTE_PORT__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.profiler_enable = __XDEBUG_PROFILER_ENABLE__" >> $TEMPLATES_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_host = __DOCKER_HOST_IP__" >> $TEMPLATES_DIR/$XDEBUG_INI

## Apache PHP preparation
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
    && a2enmod ssl

# Copy apache.conf template
COPY $CONTAINER_DIR/$APACHE_CONF $TEMPLATES_DIR/$APACHE_CONF

# Activate apache rewrite module
RUN a2enmod rewrite

# Add docker-entrypoint
COPY $CONTAINER_DIR/docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

EXPOSE 80

# Define default command
CMD ["docker-entrypoint"]