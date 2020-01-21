docker push rdeleo/centos7-php7.2-cli:7.2.26
docker push rdeleo/centos7-php7.2-cli:latest
docker build --no-cache -t rdeleo/centos7-php7.2-utils:7.2.26 -t rdeleo/centos7-php7.2-utils:latest -f containers/centos/7/php/7.2/utils/Dockerfile .
docker push rdeleo/centos7-php7.2-utils:7.2.26
docker push rdeleo/centos7-php7.2-utils:latest
docker build --no-cache -t rdeleo/centos7-php7.2-apache-dev:7.2.26 -t rdeleo/centos7-php7.2-apache-dev:latest -f containers/centos/7/php/7.2/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.2-apache-dev:7.2.26
docker push rdeleo/centos7-php7.2-apache-dev:latest
docker build --no-cache -t rdeleo/centos7-php7.2-apache-prod:7.2.26 -t rdeleo/centos7-php7.2-apache-prod:latest -f containers/centos/7/php/7.2/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.2-apache-prod:7.2.26
docker push rdeleo/centos7-php7.2-apache-prod:latest
docker build --no-cache -t rdeleo/centos7-php7.3-cli:7.3.13 -t rdeleo/centos7-php7.3-cli:latest -f containers/centos/7/php/7.3/cli/Dockerfile .
docker push rdeleo/centos7-php7.3-cli:7.3.13
docker push rdeleo/centos7-php7.3-cli:latest
docker build --no-cache -t rdeleo/centos7-php7.3-utils:7.3.13 -t rdeleo/centos7-php7.3-utils:latest -f containers/centos/7/php/7.3/utils/Dockerfile .
docker push rdeleo/centos7-php7.3-utils:7.3.13
docker push rdeleo/centos7-php7.3-utils:latest
docker build --no-cache -t rdeleo/centos7-php7.3-apache-dev:7.3.13 -t rdeleo/centos7-php7.3-apache-dev:latest -f containers/centos/7/php/7.3/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.3-apache-dev:7.3.13
docker push rdeleo/centos7-php7.3-apache-dev:latest
docker build --no-cache -t rdeleo/centos7-php7.3-apache-prod:7.3.13 -t rdeleo/centos7-php7.3-apache-prod:latest -f containers/centos/7/php/7.3/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.3-apache-prod:7.3.13
docker push rdeleo/centos7-php7.3-apache-prod:latest
docker build --no-cache -t rdeleo/centos7-php7.4-cli:7.4.1 -t rdeleo/centos7-php7.4-cli:latest -f containers/centos/7/php/7.4/cli/Dockerfile .
docker push rdeleo/centos7-php7.4-cli:7.4.1
docker push rdeleo/centos7-php7.4-cli:latest
docker build --no-cache -t rdeleo/centos7-php7.4-utils:7.4.1 -t rdeleo/centos7-php7.4-utils:latest -f containers/centos/7/php/7.4/utils/Dockerfile .
docker push rdeleo/centos7-php7.4-utils:7.4.1
docker push rdeleo/centos7-php7.4-utils:latest
docker build --no-cache -t rdeleo/centos7-php7.4-apache-dev:7.4.1 -t rdeleo/centos7-php7.4-apache-dev:latest -f containers/centos/7/php/7.4/apache/dev/Dockerfile .
docker push rdeleo/centos7-php7.4-apache-dev:7.4.1
docker push rdeleo/centos7-php7.4-apache-dev:latest
docker build --no-cache -t rdeleo/centos7-php7.4-apache-prod:7.4.1 -t rdeleo/centos7-php7.4-apache-prod:latest -f containers/centos/7/php/7.4/apache/prod/Dockerfile .
docker push rdeleo/centos7-php7.4-apache-prod:7.4.1
docker push rdeleo/centos7-php7.4-apache-prod:latest
