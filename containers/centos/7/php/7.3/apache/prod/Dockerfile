#########################################################
#                                                       #
# Centos:7.7 - Php:7.3 - Apache - Prod                  #
#                                                       #
#########################################################
FROM rdeleo/centos7-php7.3-cli:7.3.23
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /var/www/html

ARG APACHE_CONF=apache.conf
ARG APACHE_SSL_CONF=apache-ssl.conf
ARG TEMPLATES_DIR=/root/templates
ARG CONTAINER_DIR=/containers/centos/7/php/7.3/apache/prod

# Install apache and certbot
RUN yum install -y httpd mod_ssl certbot python2-certbot-apache cron crontabs supervisor

# comment out PAM
RUN sed -i -e '/pam_loginuid.so/s/^/#/' /etc/pam.d/crond

# Make template directory
RUN mkdir $TEMPLATES_DIR

# Copy apache.conf template
COPY $CONTAINER_DIR/$APACHE_CONF $TEMPLATES_DIR/$APACHE_CONF

# Copy apache-ssl.conf template
COPY $CONTAINER_DIR/$APACHE_SSL_CONF $TEMPLATES_DIR/$APACHE_SSL_CONF

# Copy scripts for SSL certificates
COPY $CONTAINER_DIR/cert-create.sh /usr/bin/cert-create
COPY $CONTAINER_DIR/cert-renew.sh /usr/bin/cert-renew

# Set the scripts as executables
RUN chmod +x /usr/bin/cert-create && \
    chmod +x /usr/bin/cert-renew

# Copy supervisord.conf file
COPY $CONTAINER_DIR/supervisord.conf /etc/supervisord.conf

# Create supervisord log folder
RUN mkdir /var/log/supervisord

# Modify apache user and relative folders
RUN usermod -u 1000 apache \
    && groupmod -g 1000 apache \
    && chown apache:apache /var/log/httpd \
    && chown apache:apache /var/www/html

# Copy crontab_ssl
COPY $CONTAINER_DIR/crontab_ssl /etc/cron.d/crontab_ssl
RUN chmod 0644 /etc/cron.d/crontab_ssl

# Import crontab_ssl
RUN crontab /etc/cron.d/crontab_ssl

# Copy docker entrypoint
COPY $CONTAINER_DIR/docker-entrypoint.sh /usr/bin/docker-entrypoint

# Set the docker-entrypoint as executable
RUN chmod +x /usr/bin/docker-entrypoint

EXPOSE 80 443

# Define default command
CMD ["docker-entrypoint"]