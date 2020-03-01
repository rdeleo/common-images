#!/bin/bash

PHP_74_LATEST=7.4.3
PHP_73_LATEST=7.3.15
PHP_72_LATEST=7.2.28

docker build --no-cache -t rdeleo/centos7-php7.4-cli:${PHP_74_LATEST} -t rdeleo/centos7-php7.4-cli:latest -f containers/centos/7/php/7.4/cli/Dockerfile .
docker push rdeleo/centos7-php7.4-cli:${PHP_74_LATEST}
docker push rdeleo/centos7-php7.4-cli:latest

docker build --no-cache -t rdeleo/centos7-php7.4-utils:${PHP_74_LATEST} -t rdeleo/centos7-php7.4-utils:latest -f containers/centos/7/php/7.4/utils/Dockerfile .
docker push rdeleo/centos7-php7.4-utils:${PHP_74_LATEST}
docker push rdeleo/centos7-php7.4-utils:latest

docker build --no-cache -t rdeleo/centos7-php7.4-apache-dev:${PHP_74_LATEST} -t rdeleo/centos7-php7.4-apache-dev:latest -f containers/centos/7/php/7.4/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.4-apache-dev:${PHP_74_LATEST}
docker push rdeleo/centos7-php7.4-apache-dev:latest

docker build --no-cache -t rdeleo/centos7-php7.4-apache-prod:${PHP_74_LATEST} -t rdeleo/centos7-php7.4-apache-prod:latest -f containers/centos/7/php/7.4/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.4-apache-prod:${PHP_74_LATEST}
docker push rdeleo/centos7-php7.4-apache-prod:latest

docker build --no-cache -t rdeleo/centos7-php7.3-cli:${PHP_73_LATEST} -t rdeleo/centos7-php7.3-cli:latest -f containers/centos/7/php/7.3/cli/Dockerfile .
docker push rdeleo/centos7-php7.3-cli:${PHP_73_LATEST}
docker push rdeleo/centos7-php7.3-cli:latest

docker build --no-cache -t rdeleo/centos7-php7.3-utils:${PHP_73_LATEST} -t rdeleo/centos7-php7.3-utils:latest -f containers/centos/7/php/7.3/utils/Dockerfile .
docker push rdeleo/centos7-php7.3-utils:${PHP_73_LATEST}
docker push rdeleo/centos7-php7.3-utils:latest

docker build --no-cache -t rdeleo/centos7-php7.3-apache-dev:${PHP_73_LATEST} -t rdeleo/centos7-php7.3-apache-dev:latest -f containers/centos/7/php/7.3/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.3-apache-dev:${PHP_73_LATEST}
docker push rdeleo/centos7-php7.3-apache-dev:latest

docker build --no-cache -t rdeleo/centos7-php7.3-apache-prod:${PHP_73_LATEST} -t rdeleo/centos7-php7.3-apache-prod:latest -f containers/centos/7/php/7.3/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.3-apache-prod:${PHP_73_LATEST}
docker push rdeleo/centos7-php7.3-apache-prod:latest

docker build --no-cache -t rdeleo/centos7-php7.2-cli:${PHP_72_LATEST} -t rdeleo/centos7-php7.2-cli:latest -f containers/centos/7/php/7.2/cli/Dockerfile .
docker push rdeleo/centos7-php7.2-cli:${PHP_72_LATEST}
docker push rdeleo/centos7-php7.2-cli:latest

docker build --no-cache -t rdeleo/centos7-php7.2-utils:${PHP_72_LATEST} -t rdeleo/centos7-php7.2-utils:latest -f containers/centos/7/php/7.2/utils/Dockerfile .
docker push rdeleo/centos7-php7.2-utils:${PHP_72_LATEST}
docker push rdeleo/centos7-php7.2-utils:latest

docker build --no-cache -t rdeleo/centos7-php7.2-apache-dev:${PHP_72_LATEST} -t rdeleo/centos7-php7.2-apache-dev:latest -f containers/centos/7/php/7.2/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.2-apache-dev:${PHP_72_LATEST}
docker push rdeleo/centos7-php7.2-apache-dev:latest

docker build --no-cache -t rdeleo/centos7-php7.2-apache-prod:${PHP_72_LATEST} -t rdeleo/centos7-php7.2-apache-prod:latest -f containers/centos/7/php/7.2/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.2-apache-prod:${PHP_72_LATEST}
docker push rdeleo/centos7-php7.2-apache-prod:latest



docker build --no-cache -t rdeleo/debian10-php7.4-cli:${PHP_74_LATEST} -t rdeleo/debian10-php7.4-cli:latest -f containers/debian/10/php/7.4/cli/Dockerfile .
docker push rdeleo/debian10-php7.4-cli:${PHP_74_LATEST}
docker push rdeleo/debian10-php7.4-cli:latest

docker build --no-cache -t rdeleo/debian10-php7.4-utils:${PHP_74_LATEST} -t rdeleo/debian10-php7.4-utils:latest -f containers/debian/10/php/7.4/utils/Dockerfile .
docker push rdeleo/debian10-php7.4-utils:${PHP_74_LATEST}
docker push rdeleo/debian10-php7.4-utils:latest

docker build --no-cache -t rdeleo/debian10-php7.4-apache-dev:${PHP_74_LATEST} -t rdeleo/debian10-php7.4-apache-dev:latest -f containers/debian/10/php/7.4/apache/dev/Dockerfile .
docker push rdeleo/debian10-php7.4-apache-dev:${PHP_74_LATEST}
docker push rdeleo/debian10-php7.4-apache-dev:latest

docker build --no-cache -t rdeleo/debian10-php7.4-apache-prod:${PHP_74_LATEST} -t rdeleo/debian10-php7.4-apache-prod:latest -f containers/debian/10/php/7.4/apache/prod/Dockerfile .
docker push rdeleo/debian10-php7.4-apache-prod:${PHP_74_LATEST}
docker push rdeleo/debian10-php7.4-apache-prod:latest

docker build --no-cache -t rdeleo/debian10-php7.3-cli:${PHP_73_LATEST} -t rdeleo/debian10-php7.3-cli:latest -f containers/debian/10/php/7.3/cli/Dockerfile .
docker push rdeleo/debian10-php7.3-cli:${PHP_73_LATEST}
docker push rdeleo/debian10-php7.3-cli:latest

docker build --no-cache -t rdeleo/debian10-php7.3-utils:${PHP_73_LATEST} -t rdeleo/debian10-php7.3-utils:latest -f containers/debian/10/php/7.3/utils/Dockerfile .
docker push rdeleo/debian10-php7.3-utils:${PHP_73_LATEST}
docker push rdeleo/debian10-php7.3-utils:latest

docker build --no-cache -t rdeleo/debian10-php7.3-apache-dev:${PHP_73_LATEST} -t rdeleo/debian10-php7.3-apache-dev:latest -f containers/debian/10/php/7.3/apache/dev/Dockerfile .
docker push rdeleo/debian10-php7.3-apache-dev:${PHP_73_LATEST}
docker push rdeleo/debian10-php7.3-apache-dev:latest

docker build --no-cache -t rdeleo/debian10-php7.3-apache-prod:${PHP_73_LATEST} -t rdeleo/debian10-php7.3-apache-prod:latest -f containers/debian/10/php/7.3/apache/prod/Dockerfile .
docker push rdeleo/debian10-php7.3-apache-prod:${PHP_73_LATEST}
docker push rdeleo/debian10-php7.3-apache-prod:latest

docker build --no-cache -t rdeleo/debian10-php7.2-cli:${PHP_72_LATEST} -t rdeleo/debian10-php7.2-cli:latest -f containers/debian/10/php/7.2/cli/Dockerfile .
docker push rdeleo/debian10-php7.2-cli:${PHP_72_LATEST}
docker push rdeleo/debian10-php7.2-cli:latest

docker build --no-cache -t rdeleo/debian10-php7.2-utils:${PHP_72_LATEST} -t rdeleo/debian10-php7.2-utils:latest -f containers/debian/10/php/7.2/utils/Dockerfile .
docker push rdeleo/debian10-php7.2-utils:${PHP_72_LATEST}
docker push rdeleo/debian10-php7.2-utils:latest

docker build --no-cache -t rdeleo/debian10-php7.2-apache-dev:${PHP_72_LATEST} -t rdeleo/debian10-php7.2-apache-dev:latest -f containers/debian/10/php/7.2/apache/dev/Dockerfile .
docker push rdeleo/debian10-php7.2-apache-dev:${PHP_72_LATEST}
docker push rdeleo/debian10-php7.2-apache-dev:latest

docker build --no-cache -t rdeleo/debian10-php7.2-apache-prod:${PHP_72_LATEST} -t rdeleo/debian10-php7.2-apache-prod:latest -f containers/debian/10/php/7.2/apache/prod/Dockerfile .
docker push rdeleo/debian10-php7.2-apache-prod:${PHP_72_LATEST}
docker push rdeleo/debian10-php7.2-apache-prod:latest











