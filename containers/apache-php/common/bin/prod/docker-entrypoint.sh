#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: Apache-php docker-entrypoint file
#########################
set -e

/usr/bin/init-apache-conf

/usr/bin/cert-create

/usr/bin/supervisord -n -c /etc/supervisord.conf
