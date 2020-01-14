# Common Images

Docker Images for common utilities. 

You can find: 
- The latest supported versions of php: 7.2.26, 7.3.13, 7.4.1
- Installed over CentOS 7, 8, and Debian 10 
- With different flavours: cli, utils wich means composer and prestissimo, apache for development with xdebug or production with automated ssl renew.

Following the container list,

Enjoy =]


## CentOS


### CentOS 7


#### CentOS7 Php7.4 Cli: 7.4.1

This is the very base container, with only CentOS 7 and Php 7.4.1. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.4-cli:7.4.1 php -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.4-cli:7.4.1 -t rdeleo/centos7-php7.4-cli:latest -f containers/centos/7/php/7.4/cli/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.4-cli:7.4.1
docker push rdeleo/centos7-php7.4-cli:latest
```

#### CentOS7 Php7.4 Utils: 7.4.1

This is the utils container, with CentOS 7, Php 7.4.1, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.4-cli:7.4.1 composer -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.4-utils:7.4.1 -t rdeleo/centos7-php7.4-utils:latest -f containers/centos/7/php/7.4/utils/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.4-utils:7.4.1
docker push rdeleo/centos7-php7.4-utils:latest
```

#### CentOS7 Php7.4 Apache Dev: 7.4.1

This is the development container, with CentOS 7, Php 7.4.1, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.4/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.4-apache-dev:7.4.1 -t rdeleo/centos7-php7.4-apache-dev:latest -f containers/centos/7/php/7.4/apache/dev/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.4-apache-dev:7.4.1
docker push rdeleo/centos7-php7.4-apache-dev:latest
```

#### CentOS7 Php7.4 Apache Prod: 7.4.1

This is the production container, with CentOS 7, Php 7.4.1, Apache 2.4.6 and Certbot to manage SSL certificates.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: centos/7/php/7.4/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.4-apache-prod:7.4.1 -t rdeleo/centos7-php7.4-apache-prod:latest -f containers/centos/7/php/7.4/apache/prod/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.4-apache-prod:7.4.1
docker push rdeleo/centos7-php7.4-apache-prod:latest
```


#### CentOS7 Php7.3 Cli: 7.3.13

This is the very base container, with only CentOS 7 and Php 7.3.13. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.3-cli:7.3.13 php -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.3-cli:7.3.13 -t rdeleo/centos7-php7.3-cli:latest -f containers/centos/7/php/7.3/cli/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.3-cli:7.3.13
docker push rdeleo/centos7-php7.3-cli:latest
```

#### CentOS7 Php7.3 Utils: 7.3.13

This is the utils container, with CentOS 7, Php 7.3.13, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.3-cli:7.3.13 composer -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.3-utils:7.3.13 -t rdeleo/centos7-php7.3-utils:latest -f containers/centos/7/php/7.3/utils/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.3-utils:7.3.13
docker push rdeleo/centos7-php7.3-utils:latest
```

#### CentOS7 Php7.3 Apache Dev: 7.3.13

This is the development container, with CentOS 7, Php 7.3.13, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.3/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.3-apache-dev:7.3.13 -t rdeleo/centos7-php7.3-apache-dev:latest -f containers/centos/7/php/7.3/apache/dev/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.3-apache-dev:7.3.13
docker push rdeleo/centos7-php7.3-apache-dev:latest
```

#### CentOS7 Php7.3 Apache Prod: 7.3.13

This is the production container, with CentOS 7, Php 7.3.13, Apache 2.4.6 and Certbot to manage SSL certificates.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: centos/7/php/7.3/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.3-apache-prod:7.3.13 -t rdeleo/centos7-php7.3-apache-prod:latest -f containers/centos/7/php/7.3/apache/prod/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.3-apache-prod:7.3.13
docker push rdeleo/centos7-php7.3-apache-prod:latest
```


#### CentOS7 Php7.2 Cli: 7.2.26

This is the very base container, with only CentOS 7 and Php 7.2.26. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.2-cli:7.2.26 php -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.2-cli:7.2.26 -t rdeleo/centos7-php7.2-cli:latest -f containers/centos/7/php/7.2/cli/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.2-cli:7.2.26
docker push rdeleo/centos7-php7.2-cli:latest
```

#### CentOS7 Php7.2 Utils: 7.2.26

This is the utils container, with CentOS 7, Php 7.2.26, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.2-cli:7.2.26 composer -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.2-utils:7.2.26 -t rdeleo/centos7-php7.2-utils:latest -f containers/centos/7/php/7.2/utils/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.2-utils:7.2.26
docker push rdeleo/centos7-php7.2-utils:latest
```

#### CentOS7 Php7.2 Apache Dev: 7.2.26

This is the development container, with CentOS 7, Php 7.2.26, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.2/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.2-apache-dev:7.2.26 -t rdeleo/centos7-php7.2-apache-dev:latest -f containers/centos/7/php/7.2/apache/dev/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.2-apache-dev:7.2.26
docker push rdeleo/centos7-php7.2-apache-dev:latest
```

#### CentOS7 Php7.2 Apache Prod: 7.2.26

This is the production container, with CentOS 7, Php 7.2.26, Apache 2.4.6 and Certbot to manage SSL certificates.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: centos/7/php/7.2/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos7-php7.2-apache-prod:7.2.26 -t rdeleo/centos7-php7.2-apache-prod:latest -f containers/centos/7/php/7.2/apache/prod/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos7-php7.2-apache-prod:7.2.26
docker push rdeleo/centos7-php7.2-apache-prod:latest
```


### CentOS 8


#### CentOS8 Php7.4 Cli: 7.4.1

This is the very base container, with only CentOS 8 and Php 7.4.1. Although httpd apache 2.4.37 is installed, is not started. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos8-php7.4-cli:7.4.1 php -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos8-php7.4-cli:7.4.1 -t rdeleo/centos8-php7.4-cli:latest -f containers/centos/8/php/7.4/cli/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos8-php7.4-cli:7.4.1
docker push rdeleo/centos8-php7.4-cli:latest
```

#### CentOS8 Php7.4 Utils: 7.4.1

This is the utils container, with CentOS 8, Php 7.4.1, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos8-php7.4-cli:7.4.1 composer -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos8-php7.4-utils:7.4.1 -t rdeleo/centos8-php7.4-utils:latest -f containers/centos/8/php/7.4/utils/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos8-php7.4-utils:7.4.1
docker push rdeleo/centos8-php7.4-utils:latest
```

#### CentOS8 Php7.4 Apache Dev: 7.4.1

This is the development container, with CentOS 8, Php 7.4.1, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.4/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/centos8-php7.4-apache-dev:7.4.1 -t rdeleo/centos8-php7.4-apache-dev:latest -f containers/centos/8/php/7.4/apache/dev/Dockerfile .
```
Push:
```bash
docker push rdeleo/centos8-php7.4-apache-dev:7.4.1
docker push rdeleo/centos8-php7.4-apache-dev:latest
```


## Debian


### Debian 10 (Buster)


#### Debian10 Php7.2 Cli: 7.2.26

This is the very base container, with only Debian 10 and Php 7.2.26.

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/debian10-php7.2-cli:7.2.26 php -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/debian10-php7.2-cli:7.2.26 -t rdeleo/debian10-php7.2-cli:latest -f containers/debian/10/php/7.2/cli/Dockerfile .
```
Push:
```bash
docker push rdeleo/debian10-php7.2-cli:7.2.26
docker push rdeleo/debian10-php7.2-cli:latest
```

#### Debian10 Php7.2 Utils: 7.2.26

This is the utils container, with Debian10 7, Php 7.2.26, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/debian10-php7.2-utils:7.2.26 composer -v
```

<b>Useful commands:</b>

Build:
```bash
docker build --no-cache -t rdeleo/debian10-php7.2-utils:7.2.26 -t rdeleo/debian10-php7.2-utils:latest -f containers/debian/10/php/7.2/utils/Dockerfile .
```
Push:
```bash
docker push rdeleo/debian10-php7.2-utils:7.2.26
docker push rdeleo/debian10-php7.2-utils:latest
```






















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

## CLI php container with composer

### 7.2

#### Build
```
docker build --no-cache -t eclipsehv/cli-php:7.2 -f containers/cli-php/7.2/Dockerfile .
```

#### Push
```
docker push eclipsehv/cli-php:7.2
```

### Web utils

### 7.2

#### Build
```
docker build --no-cache -t eclipsehv/web-utils:7.2-prod -t eclipsehv/web-utils:latest -f containers/web-utils/7.2/Dockerfile .
```

#### Push
```
docker push eclipsehv/web-utils:latest
```

