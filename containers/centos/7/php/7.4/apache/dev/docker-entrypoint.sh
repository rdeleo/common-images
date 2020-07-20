#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: Centos:7.7 - Php:7.4 - Apache - Dev docker-entrypoint file
#########################
set -e


#########################
# VARIABLES
#########################
XDEBUG_ID_KEY=${XDEBUG_ID_KEY}
XDEBUG_DEFAULT_ENABLE=${XDEBUG_DEFAULT_ENABLE}
XDEBUG_REMOTE_LOG=${XDEBUG_REMOTE_LOG}
XDEBUG_REMOTE_ENABLE=${XDEBUG_REMOTE_ENABLE}
XDEBUG_REMOTE_AUTOSTART=${XDEBUG_REMOTE_AUTOSTART}
XDEBUG_REMOTE_CONNECT_BACK=${XDEBUG_REMOTE_CONNECT_BACK}
XDEBUG_REMOTE_PORT=${XDEBUG_REMOTE_PORT}
XDEBUG_PROFILER_ENABLE=${XDEBUG_PROFILER_ENABLE}
XDEBUG_INI=15-xdebug.ini
DOCKER_HOST_IP=${DOCKER_HOST_IP}
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
APACHE_DOCUMENT_ROOT=${APACHE_DOCUMENT_ROOT}
APACHE_ERROR_LOG=${APACHE_ERROR_LOG}
APACHE_ACCESS_LOG=${APACHE_ACCESS_LOG}
APACHE_CONF_DIR=/etc/httpd/conf.d
APACHE_CONF_FILE=${APP_DOMAIN_NAME}.conf
APACHE_CONF_TEMPLATE_FILE=apache.conf
TEMPLATE_DIR=/root/templates
PHPD_DIR=/etc/php.d


#########################
# FUNCTIONS
#########################
function clean_files() {
    if [ -f "${PHPD_DIR}/${XDEBUG_INI}" ]; then
        rm ${PHPD_DIR}/${XDEBUG_INI}
    fi
    if [ -f "${APACHE_CONF_DIR}/${APACHE_CONF_FILE}" ]; then
        rm ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}
    fi
}


#########################
# MAIN
#########################
clean_files

# Init xdebug
sed -e 's~__XDEBUG_ID_KEY__~'${XDEBUG_ID_KEY}'~g' \
    -e 's~__XDEBUG_DEFAULT_ENABLE__~'${XDEBUG_DEFAULT_ENABLE}'~g' \
    -e 's~__XDEBUG_REMOTE_LOG__~"'${XDEBUG_REMOTE_LOG}'"~g' \
    -e 's~__XDEBUG_REMOTE_ENABLE__~'${XDEBUG_REMOTE_ENABLE}'~g' \
    -e 's~__XDEBUG_REMOTE_AUTOSTART__~'${XDEBUG_REMOTE_AUTOSTART}'~g' \
    -e 's~__XDEBUG_REMOTE_CONNECT_BACK__~'${XDEBUG_REMOTE_CONNECT_BACK}'~g' \
    -e 's~__XDEBUG_REMOTE_PORT__~'${XDEBUG_REMOTE_PORT}'~g' \
    -e 's~__XDEBUG_PROFILER_ENABLE__~'${XDEBUG_PROFILER_ENABLE}'~g' \
    -e 's~__DOCKER_HOST_IP__~'${DOCKER_HOST_IP}'~g' \
    ${TEMPLATE_DIR}/${XDEBUG_INI} > ${PHPD_DIR}/${XDEBUG_INI}

# Init apache
sed -e 's~__APP_DOMAIN_NAME__~'${APP_DOMAIN_NAME}'~g' \
    -e 's~__APACHE_SERVER_ADMIN_EMAIL__~'${APACHE_SERVER_ADMIN_EMAIL}'~g' \
    -e 's~__APACHE_DOCUMENT_ROOT__~"'${APACHE_DOCUMENT_ROOT}'"~g' \
    -e 's~__APACHE_DOCUMENT_DIRECTORY__~"'${APACHE_DOCUMENT_DIRECTORY}'"~g' \
    -e 's~__APACHE_ERROR_LOG__~'${APACHE_ERROR_LOG}'~g' \
    -e 's~__APACHE_ACCESS_LOG__~'${APACHE_ACCESS_LOG}'~g' \
    ${TEMPLATE_DIR}/${APACHE_CONF_TEMPLATE_FILE} > ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}

# Start Supervisor
/usr/bin/supervisord -n -c /etc/supervisord.conf
