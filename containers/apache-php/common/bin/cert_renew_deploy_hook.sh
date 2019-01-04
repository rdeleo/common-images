#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: SSL certificate creation deploy hook script, it is executed the command renew
#              successfully generate a new certificate
#########################


#########################
# VARIABLES
#########################
BLUE="\033[0;34m"
GREEN="\033[0;32m"
GREY="\033[0;37m"
NC="\033[0m"
# ENV
CERT_BOT_LOG_FILE=${CERT_BOT_LOG_FILE}

#########################
# FUNCTION
#########################
function log_info() {
    printf "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC} - ${GREY}info${NC} - $1" >> ${CERT_BOT_LOG_FILE}
}

function log_success() {
     printf "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC} - ${GREEN}success${NC} - $1" >> ${CERT_BOT_LOG_FILE}
}


#########################
# SCRIPT
#########################
log_success "SSL certificate successfully generated"

log_info "Stopping apache service ..."

service apache stop

log_info "Stopping apache service ... Done"

log_info "Starting apache service ..."

service apache start

log_info "Starting apache service ... Done"