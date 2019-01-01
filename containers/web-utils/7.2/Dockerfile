# PHP command line utils Container Image
#
# VERSION 0.0.1
FROM eclipsehv/apache-php:latest
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

## Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet \
    && rm composer-setup.php

RUN apt-get update && apt-get install -y --no-install-recommends gnupg \
    && curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh && apt-get install -y --no-install-recommends nodejs ruby irb ruby-dev** locales \
    && rm -rf /var/lib/apt/lists/*

RUN npm install grunt-cli -g
RUN gem install compass
RUN gem install sass
RUN npm install bower -g
RUN locale-gen en_US.UTF-8