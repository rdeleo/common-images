#!/bin/bash
#########################
# Author: Riccardo De Leo
#
# Description: create xdebug.ini file
#########################
set -e


#########################
# VARIABLES
#########################
PHP_CONF_DIR=/usr/local/etc/php/conf.d
XDEBUG_FILE=xdebug.ini
# ENV
DOCKER_HOST_IP=${DOCKER_HOST_IP}

#########################
# MAIN
#########################
if [ -f ${PHP_CONF_DIR}/${XDEBUG_FILE} ]; then
   rm ${PHP_CONF_DIR}/${XDEBUG_FILE}
fi

echo "xdebug.idekey=PHPSTORM" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.default_enable=0" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_enable=1" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_autostart=0" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_connect_back=0" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_port=9000" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.profiler_enable=0" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_host=${DOCKER_HOST_IP}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}