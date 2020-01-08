#########################################################
#                                                       #
# Centos:7.7 - Php:7.2 - Apache - Prod                  #
#                                                       #
#########################################################
FROM rdeleo/centos7-php7.2-cli:7.2.26
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

ARG APACHE_CONF=apache.conf
ARG APACHE_SSL_CONF=apache.conf
ARG TEMPLATES_DIR=/root/templates
ARG CONTAINER_DIR=/containers/centos/7/php/7.2/apache/prod

# Install apache and php xdebug
RUN yum install -y httpd certbot python2-certbot-apache mod_ssl

# Make template directory
RUN mkdir $TEMPLATES_DIR

# Copy apache.conf template
COPY $CONTAINER_DIR/$APACHE_CONF $TEMPLATES_DIR/$APACHE_CONF

# Copy apache-ssl.conf template
COPY $CONTAINER_DIR/$APACHE_SSL_CONF $TEMPLATES_DIR/$APACHE_SSL_CONF

# Add docker-entrypoint
COPY $CONTAINER_DIR/docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

EXPOSE 80

# Define default command
CMD ["docker-entrypoint"]