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
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
CRON_LOG_FILE=${CRON_LOG_FILE}
SSL_REGISTER_UNSAFE=${SSL_REGISTER_UNSAFE}


#########################
# FUNCTIONS
#########################
function log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR - $1" >> ${CRON_LOG_FILE}
}

function log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - INFO - $1" >> ${CRON_LOG_FILE}
}

function log_success() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS - $1" >> ${CRON_LOG_FILE}
}

function log_warning() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - WARNING - $1" >> ${CRON_LOG_FILE}
}


#########################
# MAIN
#########################
log_info "Attempt to obtain a new SSL certificate  ... Started"

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
        if [ "${SSL_REGISTER_UNSAFE}" == "YES" ]; then
            certbot certonly --standalone -n --agree-tos --register-unsafely-without-email -d ${APP_DOMAIN_NAME}
        else
            certbot certonly --standalone -n --agree-tos -m ${APACHE_SERVER_ADMIN_EMAIL} -d ${APP_DOMAIN_NAME}
        fi

        if [ -f "/etc/letsencrypt/live/${APP_DOMAIN_NAME}/fullchain.pem" ]; then
            log_success "Obtained new SSL certificate"
        else
            log_error "Attempt to obtain a new SSL certificate  ... FAILED"
        fi

        echo ${DATE_NOW} > ${CERT_LAST_RUN_PID}
    fi
fi

log_info "Attempt to obtain a new SSL certificate  ... Completed"
log_info "------------------------------------------------------"
