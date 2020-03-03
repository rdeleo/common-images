#########################################################
#                                                       #
# Centos:7.7 - Php:7.3 - Cli                            #
#                                                       #
#########################################################
FROM centos:7
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

# Upgrade and install base packages
RUN yum update -y \
    && yum install -y mariadb zip unzip xml-common \
    && yum install -y epel-release yum-utils \
    && yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php73 \
    && yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqld php-mysqli \
    && yum install -y php-zip php73-php-imap php73-php-xml php-xml php73-php-zip php73-php-mbstring php-pecl-redis

# Set default timezone, activate mysqli and zip extensions
RUN sed -e "s~;date.timezone =~date.timezone = \"UTC\"~g" -i /etc/php.ini