#########################################################
#                                                       #
# Centos:7.7 - Php:7.2 - Cli                            #
#                                                       #
#########################################################
FROM centos:7
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"
WORKDIR /home/centos

# Upgrade and install base packages
RUN yum update -y \
    && yum install -y mariadb zip unzip xml-common \
    && yum install -y epel-release yum-utils \
    && yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php72 \
    && yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqld php-mysqli \
    && yum install -y php-zip php72-php-imap php72-php-xml php-xml php72-php-zip php72-php-mbstring php-pecl-redis


# Set default timezone, activate mysqli and zip extensions
RUN sed -e "s~;date.timezone =~date.timezone = \"UTC\"~g" -i /etc/php.ini