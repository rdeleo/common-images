#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: Centos:7.7 - Php:7.2 - Apache - Prod docker-entrypoint file
#########################
set -e

#########################
# VARIABLES
#########################
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
APACHE_DOCUMENT_ROOT=${APACHE_DOCUMENT_ROOT}
APACHE_ERROR_LOG=${APACHE_ERROR_LOG}
APACHE_ACCESS_LOG=${APACHE_ACCESS_LOG}
APACHE_SSL_ERROR_LOG=${APACHE_SSL_ERROR_LOG}
APACHE_SSL_ACCESS_LOG=${APACHE_SSL_ACCESS_LOG}
APACHE_CONF_DIR=/etc/httpd/conf.d
APACHE_CONF_FILE=${APP_DOMAIN_NAME}.conf
APACHE_CONF_SSL_FILE=${APP_DOMAIN_NAME}-le-ssl.conf
APACHE_CONF_TEMPLATE_FILE=apache.conf
APACHE_CONF_SSL_TEMPLATE_FILE=apache-ssl.conf
TEMPLATE_DIR=/root/templates
PHPD_DIR=/etc/php.d

#########################
# FUNCTIONS
#########################
function clean_files() {
    if [ -f "${APACHE_CONF_DIR}/${APACHE_CONF_FILE}" ]; then
        rm ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}
    fi
    if [ -f "${APACHE_CONF_DIR}/${APACHE_CONF_SSL_FILE}" ]; then
        rm ${APACHE_CONF_DIR}/${APACHE_CONF_SSL_FILE}
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
    ${TEMPLATE_DIR}/${APACHE_CONF_TEMPLATE_FILE} > ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}

sed -e 's~__APP_DOMAIN_NAME__~'${APP_DOMAIN_NAME}'~g' \
    -e 's~__APACHE_SERVER_ADMIN_EMAIL__~'${APACHE_SERVER_ADMIN_EMAIL}'~g' \
    -e 's~__APACHE_DOCUMENT_ROOT__~'${APACHE_DOCUMENT_ROOT}'~g' \
    -e 's~__APACHE_SSL_ERROR_LOG__~'${APACHE_SSL_ERROR_LOG}'~g' \
    -e 's~__APACHE_SSL_ACCESS_LOG__~'${APACHE_SSL_ACCESS_LOG}'~g' \
    ${TEMPLATE_DIR}/${APACHE_CONF_SSL_TEMPLATE_FILE} > ${APACHE_CONF_DIR}/${APACHE_CONF_SSL_FILE}

/usr/bin/cert-create

/usr/bin/supervisord -n -c /etc/supervisord.conf
