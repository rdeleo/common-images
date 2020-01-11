#########################################################
#                                                       #
# Centos:7.7 - Php:7.3 - Apache - Dev                   #
#                                                       #
#########################################################
FROM rdeleo/centos7-php7.3-cli:7.3.13
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

ARG PHPD_DIR=/etc/php.d
ARG XDEBUG_INI=15-xdebug.ini
ARG APACHE_CONF=apache.conf
ARG TEMPLATES_DIR=/root/templates
ARG CONTAINER_DIR=/containers/centos/7/php/7.3/apache/dev

# Install apache and php xdebug
RUN yum install -y httpd php-xdebug

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

EXPOSE 80

# Define default command
CMD ["docker-entrypoint"]