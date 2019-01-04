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
# ANSI colors
BLUE="\033[0;34m"
GREY="\033[0;37m"
YELLOW="\033[1;33m"
NC="\033[0m"
# ENV
APP_USE_SSL=${APP_USE_SSL}
APP_DOMAIN_NAME=${APP_DOMAIN_NAME}
APACHE_SERVER_ADMIN_EMAIL=${APACHE_SERVER_ADMIN_EMAIL}
CERT_BOT_LOG_FILE=${CERT_BOT_LOG_FILE}


#########################
# FUNCTIONS
#########################
function log_info() {
    printf "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC} - ${GREY}info${NC} - $1" >> ${CERT_BOT_LOG_FILE}
}

function log_warning() {
    printf "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC} - ${YELLOW}warning${NC} - $1" >> ${CERT_BOT_LOG_FILE}
}


#########################
# MAIN
#########################
log_info "SSL certificate renew attempt ... Started"


if [ -f ${CERT_LAST_RUN_PID} ]; then
    DATE_PID=$(head -n 1 ${CERT_LAST_RUN_PID})
fi

if [ "${DATE_NOW}" == "${DATE_PID}" ]; then
    log_warning "You already attempted to build a certificate today!"
fi

certbot renew --standalone -n --agree-tos -m r@rdeleo.com -d ${APP_DOMAIN_NAME} --deploy-hook "cert-renew-deploy-hook"

echo ${DATE_NOW} > ${CERT_LAST_RUN_PID}

log_info "SSL certificate renew attempt ... Completed"
