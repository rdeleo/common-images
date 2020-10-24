#########################################################
#                                                       #
# Centos:7.7 - Php:7.3 - Utils                          #
#                                                       #
#########################################################
FROM rdeleo/centos7-php7.3-cli:7.3.23
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Create centos user
RUN groupadd -g 1000 centos \
    && useradd -rm -d /home/centos -s /bin/bash -g 1000 -u 1000 centos

USER centos

WORKDIR /home/centos

# Install prestissimo
RUN /usr/bin/composer global require hirak/prestissimo