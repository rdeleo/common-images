#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: substitute environment variables into apache configuration name
#########################


#########################
# VARIABLES
#########################
APACHE_TEMPLATE_DIR="/etc/apache2/templates"
APACHE_TEMPLATE_FILE="apache-default-template.conf"
APACHE_TEMPLATE_FILE_SSL="apache-default-ssl-template.conf"
APACHE_CONF_FILE="/etc/apache2/sites-available/000-default.conf"

# ENV
APP_USE_SSL=${APP_USE_SSL}
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
APACHE_DOCUMENT_ROOT=${APACHE_DOCUMENT_ROOT}
APACHE_ERROR_LOG=${APACHE_ERROR_LOG}
APACHE_ACCESS_LOG=${APACHE_ACCESS_LOG}
APACHE_SSL_ERROR_LOG=${APACHE_SSL_ERROR_LOG}
APACHE_SSL_ACCESS_LOG=${APACHE_SSL_ACCESS_LOG}
SSL_CERTIFICATE_FILE=${SSL_CERTIFICATE_FILE}
SSL_CERTIFICATE_KEY_FILE=${SSL_CERTIFICATE_KEY_FILE}


#########################
# FUNCTIONS
#########################
function clean_files() {
    if [ -f "${APACHE_CONF_FILE}" ]; then
        rm ${APACHE_CONF_FILE}
    fi
}


#########################
# MAIN
#########################
clean_files

if [ "${APP_USE_SSL}" == "YES" ]; then
    cp ${APACHE_TEMPLATE_DIR}/${APACHE_TEMPLATE_FILE_SSL} ${APACHE_CONF_FILE}

    sed -i 's/__APP_DOMAIN_NAME__/'$(echo ${APP_DOMAIN_NAME} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_SERVER_ADMIN_EMAIL__/'$(echo ${APACHE_SERVER_ADMIN_EMAIL} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_DOCUMENT_ROOT__/'$(echo ${APACHE_DOCUMENT_ROOT} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_ERROR_LOG__/'$(echo ${APACHE_ERROR_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_ACCESS_LOG__/'$(echo ${APACHE_ACCESS_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_SSL_ERROR_LOG__/'$(echo ${APACHE_SSL_ERROR_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_SSL_ACCESS_LOG__/'$(echo ${APACHE_SSL_ACCESS_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__SSL_CERTIFICATE_FILE__/'$(echo ${SSL_CERTIFICATE_FILE} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__SSL_CERTIFICATE_KEY_FILE__/'$(echo ${SSL_CERTIFICATE_KEY_FILE} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
else
    cp ${APACHE_TEMPLATE_DIR}/${APACHE_TEMPLATE_FILE} ${APACHE_CONF_FILE}

    sed -i 's/__APP_DOMAIN_NAME__/'$(echo ${APP_DOMAIN_NAME} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_SERVER_ADMIN_EMAIL__/'$(echo ${APACHE_SERVER_ADMIN_EMAIL} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_DOCUMENT_ROOT__/'$(echo ${APACHE_DOCUMENT_ROOT} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_ERROR_LOG__/'$(echo ${APACHE_ERROR_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
    sed -i 's/__APACHE_ACCESS_LOG__/'$(echo ${APACHE_ACCESS_LOG} | sed 's_/_\\/_g')'/g' ${APACHE_CONF_FILE}
fi
