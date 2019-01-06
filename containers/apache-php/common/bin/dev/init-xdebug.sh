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
XDEBUG_ID_KEY=${XDEBUG_ID_KEY}
XDEBUG_DEFAULT_ENABLE=${XDEBUG_DEFAULT_ENABLE}
XDEBUG_REMOTE_ENABLE=${XDEBUG_REMOTE_ENABLE}
XDEBUG_REMOTE_AUTOSTART=${XDEBUG_REMOTE_AUTOSTART}
XDEBUG_REMOTE_CONNECT_BACK=${XDEBUG_REMOTE_CONNECT_BACK}
XDEBUG_REMOTE_PORT=${XDEBUG_REMOTE_PORT}
XDEBUG_PROFILER_ENABLE=${XDEBUG_PROFILER_ENABLE}
DOCKER_HOST_IP=${DOCKER_HOST_IP}
#########################
# MAIN
#########################
if [ -f "${PHP_CONF_DIR}/${XDEBUG_FILE}" ]; then
   rm ${PHP_CONF_DIR}/${XDEBUG_FILE}
fi

echo "xdebug.idekey=${XDEBUG_ID_KEY}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.default_enable=${XDEBUG_DEFAULT_ENABLE}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_enable=${XDEBUG_REMOTE_ENABLE}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_autostart=${XDEBUG_REMOTE_AUTOSTART}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_connect_back=${XDEBUG_REMOTE_CONNECT_BACK}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_port=${XDEBUG_REMOTE_PORT}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.profiler_enable=${XDEBUG_PROFILER_ENABLE}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}
echo "xdebug.remote_host=${DOCKER_HOST_IP}" >> ${PHP_CONF_DIR}/${XDEBUG_FILE}