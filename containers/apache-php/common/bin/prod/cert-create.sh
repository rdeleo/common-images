#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: SSL Certificate creation script
#########################


#########################
# VARIABLES
#########################
DATE_PID=0
DATE_NOW=$(date '+%Y-%m-%d');
CERT_LAST_RUN_PID=/etc/letsencrypt/lastrun.pid
# ENV
APP_USE_SSL=${APP_USE_SSL}
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
CRON_LOG_FILE=${CRON_LOG_FILE}


#########################
# FUNCTIONS
#########################
function log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - INFO - $1" >> ${CRON_LOG_FILE}
}

function log_warning() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - WARNING - $1" >> ${CRON_LOG_FILE}
}


#########################
# MAIN
#########################
log_info "SSL certificate create attempt ... Started"

if [ "${APP_USE_SSL}" == "YES" ]; then

    if [ -f "/etc/letsencrypt/live/${APP_DOMAIN_NAME}/fullchain.pem" ]; then
        log_warning "Certificate already created"
    else
        if [ -f ${CERT_LAST_RUN_PID} ]; then
            DATE_PID=$(head -n 1 ${CERT_LAST_RUN_PID})
        fi

        if [ "${DATE_NOW}" == "${DATE_PID}" ]; then
            log_warning "You already attempted to build a certificate today"

            # Here you could decide to stop the attempt, if so uncomment following line
        else
            certbot certonly --standalone -n --agree-tos -m ${APACHE_SERVER_ADMIN_EMAIL} -d ${APP_DOMAIN_NAME}

            echo ${DATE_NOW} > ${CERT_LAST_RUN_PID}
        fi
    fi

    log_info "SSL certificate creation attempt ... Completed"
else
    log_info "SSL certificate creation attempt ... Not Executed because APP_USE_SSL = ${APP_USE_SSL}"
fi
