#########################################################
#                                                       #
# Debian:10 - Php:7.2 - Apache - Prod                   #
#                                                       #
#########################################################
FROM php:7.2.34-apache-buster
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

ARG APACHE_CONF=apache.conf
ARG TEMPLATES_DIR=/var/www/templates
ARG CONTAINER_DIR=/containers/debian/10/php/7.2/apache/prod

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
    ## Cron and spervisor
    && apt-get install -y --no-install-recommends cron rsyslog supervisor \
    && rm -rf /etc/cron.* \
    && mkdir /var/log/cron && touch /var/log/cron/cron.log \
    ## Clean-up
    && rm -rf /var/lib/apt/lists/*

# Install redis extension
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

# Install certbot
RUN echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list && \
    apt update -y && \
    apt-get install -y certbot -t buster-backports

# Make template directory
RUN mkdir $TEMPLATES_DIR

# Copy apache.conf template
COPY $CONTAINER_DIR/$APACHE_CONF $TEMPLATES_DIR/$APACHE_CONF

# Copy scripts for SSL certificates
COPY $CONTAINER_DIR/cert-create.sh /usr/bin/cert-create
COPY $CONTAINER_DIR/cert-renew.sh /usr/bin/cert-renew

# Set the scripts as executables
RUN chmod +x /usr/bin/cert-create && \
    chmod +x /usr/bin/cert-renew

# Copy supervisord.conf file
COPY $CONTAINER_DIR/supervisord.conf /etc/supervisord.conf

# Create supervisord log folder
RUN mkdir -p /var/log/supervisord

# Copy crontab_ssl
COPY $CONTAINER_DIR/crontab_ssl /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab

# Activate apache rewrite and ssl modules
RUN a2enmod rewrite && \
    a2enmod ssl

# Copy docker entrypoint
COPY $CONTAINER_DIR/docker-entrypoint.sh /usr/bin/docker-entrypoint

# Set the docker-entrypoint as executable
RUN chmod +x /usr/bin/docker-entrypoint

EXPOSE 80 443

# Define default command
CMD ["docker-entrypoint"]