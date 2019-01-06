#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: Apache-php dev docker-entrypoint file
#########################
set -e

/usr/bin/init-xdebug

/usr/bin/init-apache-conf

/usr/bin/cert-create

/usr/bin/supervisord -n -c /etc/supervisord.conf
