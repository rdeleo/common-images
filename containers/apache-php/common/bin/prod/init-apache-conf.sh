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
APACHE_TEMPORARY_FILE="apache-tmp-default.conf"
APACHE_CONF_DIR="/etc/apache2/sites-available"
APACHE_CONF_FILE="000-default.conf"
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
    if [ -f "${APACHE_TEMPLATE_DIR}/${APACHE_TEMPORARY_FILE}" ]; then
        rm ${APACHE_TEMPLATE_DIR}/${APACHE_TEMPORARY_FILE}
    fi

    if [ -f "${APACHE_CONF_DIR}/${APACHE_CONF_FILE}" ]; then
        rm ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}
    fi
}

function substitute() {
    FILE_NAME="${APACHE_CONF_DIR}/${APACHE_CONF_FILE}"
    FILE_TMP="${APACHE_TEMPLATE_DIR}/${APACHE_TEMPORARY_FILE}"
    OLD_STRING=$1
    NEW_STRING=$2

    cp ${FILE_NAME} ${FILE_TMP}

    rm ${FILE_NAME}

    sed 's/'${OLD_STRING}'/'${NEW_STRING}'/g' <${FILE_TMP} >${FILE_NAME}

    rm ${FILE_TMP}
}


#########################
# MAIN
#########################
clean_files

if [ "${APP_USE_SSL}" == "YES" ]; then
    cp ${APACHE_TEMPLATE_DIR}/${APACHE_TEMPLATE_FILE_SSL} ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}

    substitute "__APP_DOMAIN_NAME__" ${APP_DOMAIN_NAME}
    substitute "__APACHE_SERVER_ADMIN_EMAIL__" ${APACHE_SERVER_ADMIN_EMAIL}
    substitute "__APACHE_DOCUMENT_ROOT__" ${APACHE_DOCUMENT_ROOT}
    substitute "__APACHE_ERROR_LOG__" ${APACHE_ERROR_LOG}
    substitute "__APACHE_ACCESS_LOG__" ${APACHE_ACCESS_LOG}
    substitute "__APACHE_SSL_ERROR_LOG__" ${APACHE_SSL_ERROR_LOG}
    substitute "__APACHE_SSL_ACCESS_LOG__" ${APACHE_SSL_ACCESS_LOG}
    substitute "__SSL_CERTIFICATE_FILE__" ${SSL_CERTIFICATE_FILE}
    substitute "__SSL_CERTIFICATE_KEY_FILE__" ${SSL_CERTIFICATE_KEY_FILE}
else
    cp ${APACHE_TEMPLATE_DIR}/${APACHE_TEMPLATE_FILE} ${APACHE_CONF_DIR}/${APACHE_CONF_FILE}

    substitute "__APP_DOMAIN_NAME__" ${APP_DOMAIN_NAME}
    substitute "__APACHE_SERVER_ADMIN_EMAIL__" ${APACHE_SERVER_ADMIN_EMAIL}
    substitute "__APACHE_DOCUMENT_ROOT__" ${APACHE_DOCUMENT_ROOT}
    substitute "__APACHE_ERROR_LOG__" ${APACHE_ERROR_LOG}
    substitute "__APACHE_ACCESS_LOG__" ${APACHE_ACCESS_LOG}
fi
