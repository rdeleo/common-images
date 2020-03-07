#########################################################
#                                                       #
# Centos:7.7 - Php:7.4 - Cli                            #
#                                                       #
#########################################################
FROM centos:7
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

# Upgrade and install base packages
RUN yum update -y \
    && yum install -y mariadb zip unzip xml-common \
    && yum install -y epel-release yum-utils \
    && yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php74 \
    && yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqld php-mysqli \
    && yum install -y php-zip php74-php-imap php74-php-xml php-xml php74-php-zip php74-php-mbstring php-mbstring php-pecl-redis

# Set default timezone, activate mysqli and zip extensions
RUN sed -e "s~;date.timezone =~date.timezone = \"UTC\"~g" -i /etc/php.ini