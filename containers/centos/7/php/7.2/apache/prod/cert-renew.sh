#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: SSL Certificate renew script
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
log_info "Attempt to renew a new SSL certificate  ... Started"

if [ -f ${CERT_LAST_RUN_PID} ]; then
    DATE_PID=$(head -n 1 ${CERT_LAST_RUN_PID})
fi

if [ "${DATE_NOW}" == "${DATE_PID}" ]; then
    log_warning "You already attempted to renew a certificate today!"
fi

supervisorctl stop apache

sleep 1

certbot renew --standalone -n --agree-tos -m ${APACHE_SERVER_ADMIN_EMAIL} -d ${APP_DOMAIN_NAME}

sleep 1

supervisorctl start apache

echo ${DATE_NOW} > ${CERT_LAST_RUN_PID}

log_info "Attempt to renew a new SSL certificate  ... Completed"
