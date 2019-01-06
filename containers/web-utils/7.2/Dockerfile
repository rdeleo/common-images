# PHP command line utils Container Image
#
# VERSION 0.0.1
FROM eclipsehv/apache-php:7.2-dev
LABEL MAINTAINER="Riccardo De Leo <r@rdeleo.com>"

## Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer

RUN apt-get update && apt-get install -y --no-install-recommends gnupg \
    && curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh && apt-get install -y --no-install-recommends nodejs ruby irb ruby-dev** locales \
    && rm -rf /var/lib/apt/lists/*

RUN npm install grunt-cli -g
RUN gem install compass
RUN gem install sass
RUN npm install bower -g
RUN locale-gen en_US.UTF-8