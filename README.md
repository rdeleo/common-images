# common-images
Docker containers of common utilities.

## Apache php container

### PROD

#### Environment Variables
You have to setup the following environment variables to run properly the prod container:
 
Apache variables (var name and description)

- APP_USE_SSL               YES or empty / anything else if you don't want to use ssl
- APP_DOMAIN_NAME           App domain name without protocol prefix
- CRON_LOG_FILE             Path and filename of the cron log file, usually ```/var/log/cron/cron.log```
- APACHE_SERVER_ADMIN_EMAIL Apache server admin email
- APACHE_DOCUMENT_ROOT      Path for the apache document root, usually ```/var/www/html```
- APACHE_ERROR_LOG          Path and filename for apache error log
- APACHE_ACCESS_LOG         Path and filename for apache access log
- APACHE_SSL_ERROR_LOG      Path and filename for apache ssl error log
- APACHE_SSL_ACCESS_LOG     Path and filename for apache ssl access log
- SSL_CERTIFICATE_FILE      Path and filename for cert file
- SSL_CERTIFICATE_KEY_FILE  Path and filename for cert key file

PHP variables (var name and suggested default value)

- PHP_DOCREF_ROOT=0
- PHP_DOCREF_EXT=0
- PHP_SHORT_OPEN_TAG=Off
- PHP_DYSPLAY_STARTUP_ERRORS=Off
- PHP_DYSPLAY_ERRORS=Off
- PHP_HTML_ERRORS=Off
- PHP_LOG_ERRORS=On
- PHP_ERROR_LOG=/var/log/php/error.log
- PHP_ERROR_REPORTING=E_ERROR
- PHP_MEMORY_LIMIT=1024M
- PHP_UPLOAD_MAX_FILESIZE=256M
- PHP_POST_MAX_SIZE=256M
- PHP_MAX_EXECUTION_TIME=300
- PHP_MAX_INPUT_TIME=240
- PHP_MAX_INPUT_NESTING_LEVEL=100
- PHP_MAX_INPUT_VARS=1000

#### Volumes
I would suggest you to bind the following volumes:

- /var/www/html
- /var/log/apache2
- /var/log/cron
- /var/log/php
- /var/log/supervisord

#### Build

##### 7.0
```
docker build --no-cache -t eclipsehv/apache-php:7.0-prod -f containers/apache-php/7.0/prod/Dockerfile .
```

##### 7.2 latest
```
docker build --no-cache -t eclipsehv/apache-php:7.2-prod -t eclipsehv/apache-php:latest -f containers/apache-php/7.2/prod/Dockerfile .
```

#### Push

##### 7.0
```
docker push eclipsehv/apache-php:7.0-prod
```

##### 7.2 latest
```
docker push eclipsehv/apache-php:7.2-prod
docker push eclipsehv/apache-php:latest
```

### DEV

#### Environment variables
In addition of the prod one, you have to setup the following environment variables to run properly the dev container:

XDEBUG variables (var name and suggested default value or description)

- XDEBUG_ID_KEY=PHPSTORM
- XDEBUG_DEFAULT_ENABLE=0
- XDEBUG_REMOTE_ENABLE=1
- XDEBUG_REMOTE_AUTOSTART=0
- XDEBUG_REMOTE_CONNECT_BACK=0
- XDEBUG_REMOTE_PORT=9000
- XDEBUG_PROFILER_ENABLE=0
- DOCKER_HOST_IP = insert here the host machine ip address, possibly the lan or wlan one

#### Build

##### 7.0
```
docker build --no-cache -t eclipsehv/apache-php:7.0-dev -f containers/apache-php/7.0/dev/Dockerfile .
```

##### 7.2 latest
```
docker build --no-cache -t eclipsehv/apache-php:7.2-dev -f containers/apache-php/7.2/dev/Dockerfile .
```

#### Push

##### 7.0
```
docker push eclipsehv/apache-php:7.0-dev
```

##### 7.2 latest
```
docker push eclipsehv/apache-php:7.2-dev
```

## Web Utils Container
- Build the image based on php 7.2 (latest)
```
docker build --no-cache -t eclipsehv/web-utils:7.2-prod -t eclipsehv/web-utils:latest -f containers/web-utils/7.2/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/web-utils:latest
```

