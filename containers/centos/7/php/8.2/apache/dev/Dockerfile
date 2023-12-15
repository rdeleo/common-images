#########################################################
#                                                       #
# Centos:7.7 - Php:8.2 - Apache - Dev                   #
#                                                       #
#########################################################
FROM centos:7
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

ARG PHPD_DIR=/etc/php.d
ARG XDEBUG_INI=15-xdebug.ini
ARG APACHE_CONF=apache.conf
ARG TEMPLATES_DIR=/root/templates
ARG CONTAINER_DIR=./

# Upgrade and install base packages
RUN yum install -y deltarpm
RUN yum update -y
RUN yum install -y mariadb zip unzip xml-common
RUN yum install -y epel-release yum-utils
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php82
RUN yum install -y gd gd-devel php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqld php-mysqli
RUN yum install -y php-zip php82-php-imap php82-php-xml php-xml php82-php-zip php82-php-mbstring php-mbstring php-pecl-redis

# Set default timezone, activate mysqli and zip extensions
RUN sed -e "s~;date.timezone =~date.timezone = \"UTC\"~g" -i /etc/php.ini

# Install apache, supervisor and php xdebug
RUN yum install -y httpd supervisor php-xdebug

# Copy supervisord.conf file
COPY $CONTAINER_DIR/supervisord.conf /etc/supervisord.conf

# Create supervisord log folder
RUN mkdir /var/log/supervisord

# Add placeholders to xdebug.ini file
RUN echo "xdebug.idekey = __XDEBUG_ID_KEY__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.default_enable = __XDEBUG_DEFAULT_ENABLE__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_log = __XDEBUG_REMOTE_LOG__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_enable = __XDEBUG_REMOTE_ENABLE__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_autostart = __XDEBUG_REMOTE_AUTOSTART__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_connect_back = __XDEBUG_REMOTE_CONNECT_BACK__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_port = __XDEBUG_REMOTE_PORT__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.profiler_enable = __XDEBUG_PROFILER_ENABLE__" >> $PHPD_DIR/$XDEBUG_INI \
    && echo "xdebug.remote_host = __DOCKER_HOST_IP__" >> $PHPD_DIR/$XDEBUG_INI

# Make template directory
RUN mkdir $TEMPLATES_DIR

# Move xdebug.ini to templates directory
RUN mv $PHPD_DIR/$XDEBUG_INI $TEMPLATES_DIR/$XDEBUG_INI

# Copy apache.conf template
COPY $CONTAINER_DIR/$APACHE_CONF $TEMPLATES_DIR/$APACHE_CONF

# Add docker-entrypoint
COPY $CONTAINER_DIR/docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Install prestissimo
#RUN /usr/bin/composer global require hirak/prestissimo

RUN usermod -u 1000 apache \
    && groupmod -g 1000 apache \
    && chown apache:apache /var/log/httpd \
    && chown apache:apache /var/www/html

WORKDIR /var/www/html

EXPOSE 80

# Define default command
CMD ["docker-entrypoint"]
