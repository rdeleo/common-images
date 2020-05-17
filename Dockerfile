# Core Application Container Image Dev Environment
#
# VERSION 0.0.1

###########################
#    Create dev image     #
###########################
FROM rdeleo/centos7-php7.4-apache-dev:latest

RUN yum update -y

#Copy apache configuration file
COPY ./containers/core-app/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite && a2enmod ssl

#Copy compiled SSO client files
COPY --from=composer-install-stage /var/www/core /var/www/html

RUN mkdir /var/www/html/backup

RUN chown www-data:www-data /var/www/html
RUN chown -R www-data:www-data /var/www/html/*

RUN chmod -R 777 /var/www/html/logs/ && \
    chown -R www-data:www-data /var/www/html/logs

RUN chmod -R 777 /var/www/html/cache/ && \
    chown -R www-data:www-data /var/www/html/cache

#Create files folder
RUN mkdir -p /var/www/html/public/files && chmod -R 755 /var/www/html/public/files  && \
    chown -R www-data:www-data /var/www/html/public/files

RUN mkdir -p /var/www/html/public/files/clean && chmod -R 755 /var/www/html/public/files/clean  && \
    chown -R www-data:www-data /var/www/html/public/files/clean

RUN mkdir -p /var/www/html/public/files/input && chmod -R 755 /var/www/html/public/files/input  && \
    chown -R www-data:www-data /var/www/html/public/files/input

RUN mkdir -p /infected && chmod -R 755 /infected  && \
    chown -R www-data:www-data /infected

COPY ./cli.php /var/www/html/cli.php
COPY ./public/index.php /var/www/html/public/index.php
COPY ./public/.htaccess /var/www/html/public/.htaccess

COPY ./containers/core-app/crontab /etc/cron.d/crontab

RUN chmod a+x /etc/cron.d/crontab && \
    crontab /etc/cron.d/crontab

# Add configuration files
COPY ./containers/core-app/supervisord.conf /etc/supervisord.conf

# Add db setup script
COPY ./containers/core-app/bash/db_setup.sh /usr/bin/db_setup
RUN chmod +x /usr/bin/db_setup

# Add migrations script
COPY ./containers/core-app/bash/migrations.sh /usr/bin/migrations
RUN chmod +x /usr/bin/migrations

# Add patches script
COPY ./containers/core-app/bash/patches.sh /usr/bin/patches
RUN chmod +x /usr/bin/patches

# Add mysql import script
COPY ./containers/core-app/bash/mysql_import.sh /usr/bin/mysql_import
RUN chmod +x /usr/bin/mysql_import

# Add mysql dump script
COPY ./containers/core-app/bash/mysql_dump.sh /usr/bin/mysql_dump
RUN chmod +x /usr/bin/mysql_dump

# Install ClamAV
RUN yum update && \
    yum install -y --no-install-recommends clamav && \
    rm -rf /var/lib/apt/lists/*

# Update ClamAV Database
RUN freshclam

# Add clamAV scan script
COPY ./containers/core-app/bash/clamav_scan.sh /usr/bin/clamav_scan
RUN chmod +x /usr/bin/clamav_scan

COPY ./containers/core-app/dev/hosts-update.sh /usr/bin/hosts-update
RUN chmod +x /usr/bin/hosts-update

# Add docker entrypoint
COPY ./containers/core-app/bash/docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]