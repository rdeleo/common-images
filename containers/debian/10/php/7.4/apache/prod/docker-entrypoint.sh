#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: Debian:10 - Php:7.4 - Apache - Prod docker-entrypoint file
#########################
set -e


#########################
# VARIABLES
#########################
APACHE_CONF_DIR=/etc/apache2/sites-available
APACHE_CONF_FILE=000-default.conf
APACHE_CONF_TEMPLATE_FILE=apache.conf
TEMPLATE_DIR=/var/www/templates
# ENV
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
APACHE_DOCUMENT_ROOT=${APACHE_DOCUMENT_ROOT}
APACHE_ERROR_LOG=${APACHE_ERROR_LOG}
APACHE_ACCESS_LOG=${APACHE_ACCESS_LOG}
APACHE_SSL_ERROR_LOG=${APACHE_SSL_ERROR_LOG}
APACHE_SSL_ACCESS_LOG=${APACHE_SSL_ACCESS_LOG}


#########################
# FUNCTIONS
#########################
function clean_files() {
    if [ -f "${APACHE_CONF_DIR}/${APACHE_CONF_FILE}" ]; then
        rm ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}
    fi
}


#########################
# MAIN
#########################
clean_files

# Init apache
sed -e 's~__APP_DOMAIN_NAME__~'${APP_DOMAIN_NAME}'~g' \
    -e 's~__APACHE_SERVER_ADMIN_EMAIL__~'${APACHE_SERVER_ADMIN_EMAIL}'~g' \
    -e 's~__APACHE_ERROR_LOG__~'${APACHE_ERROR_LOG}'~g' \
    -e 's~__APACHE_ACCESS_LOG__~'${APACHE_ACCESS_LOG}'~g' \
    -e 's~__APACHE_DOCUMENT_ROOT__~'${APACHE_DOCUMENT_ROOT}'~g' \
    -e 's~__APACHE_SSL_ERROR_LOG__~'${APACHE_SSL_ERROR_LOG}'~g' \
    -e 's~__APACHE_SSL_ACCESS_LOG__~'${APACHE_SSL_ACCESS_LOG}'~g' \
    ${TEMPLATE_DIR}/${APACHE_CONF_TEMPLATE_FILE} > ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}

/usr/bin/cert-create

/usr/bin/supervisord -n -c /etc/supervisord.conf
