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
CRON_LOG_FILE=${CRON_LOG_FILE}

#########################
# FUNCTION
#########################
function log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - INFO - $1" >> ${CRON_LOG_FILE}
}

function log_success() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS - $1" >> ${CRON_LOG_FILE}
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