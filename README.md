# Common Images

( PHP ) Docker Containers for Common Utilities. 

You can find: 
- The latest supported versions of php: 7.2.34, 7.3.23, 7.4.11
- Installed over CentOS 7, 8, and Debian 10 
- With different flavours: cli, utils (wich means composer and prestissimo), apache for development with xdebug or production ssl certificates automatically renewed.

Following the container list, Enjoy =]


## CentOS


### CentOS 7


#### CentOS7 Php7.4 Cli: 7.4.11

This is the very base container, with only CentOS 7 and Php 7.4.11. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.4-cli:7.4.11 php -v
```

#### CentOS7 Php7.4 Utils: 7.4.11

This is the utils container, with CentOS 7, Php 7.4.11, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.4-cli:7.4.11 composer -v
```

#### CentOS7 Php7.4 Apache Dev: 7.4.11

This is the development container, with CentOS 7, Php 7.4.11, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.4/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

#### CentOS7 Php7.4 Apache Prod: 7.4.11

This is the production container, with CentOS 7, Php 7.4.11, Apache 2.4.6 and Certbot to manage a grade A+ (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

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


#### CentOS7 Php7.3 Cli: 7.3.23

This is the very base container, with only CentOS 7 and Php 7.3.23. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.3-cli:7.3.23 php -v
```

#### CentOS7 Php7.3 Utils: 7.3.23

This is the utils container, with CentOS 7, Php 7.3.23, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.3-cli:7.3.23 composer -v
```

#### CentOS7 Php7.3 Apache Dev: 7.3.23

This is the development container, with CentOS 7, Php 7.3.23, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.3/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).


#### CentOS7 Php7.3 Apache Prod: 7.3.23

This is the production container, with CentOS 7, Php 7.3.23, Apache 2.4.6 and Certbot to manage a grade A+ (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

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


#### CentOS7 Php7.2 Cli: 7.2.34

This is the very base container, with only CentOS 7 and Php 7.2.34. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos7-php7.2-cli:7.2.34 php -v
```

#### CentOS7 Php7.2 Utils: 7.2.34

This is the utils container, with CentOS 7, Php 7.2.34, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos7-php7.2-cli:7.2.34 composer -v
```

#### CentOS7 Php7.2 Apache Dev: 7.2.34

This is the development container, with CentOS 7, Php 7.2.34, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.2/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

#### CentOS7 Php7.2 Apache Prod: 7.2.34

This is the production container, with CentOS 7, Php 7.2.34, Apache 2.4.6 and Certbot to manage a grade A+ (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

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


### CentOS 8


#### CentOS8 Php7.4 Cli: 7.4.11

This is the very base container, with only CentOS 8 and Php 7.4.11. Although httpd apache 2.4.37 is installed, is not started. 

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/centos8-php7.4-cli:7.4.11 php -v
```

#### CentOS8 Php7.4 Utils: 7.4.11

This is the utils container, with CentOS 8, Php 7.4.11, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/centos8-php7.4-cli:7.4.11 composer -v
```

#### CentOS8 Php7.4 Apache Dev: 7.4.11

This is the development container, with CentOS 8, Php 7.4.11, Apache 2.4.6 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: centos/7/php/7.4/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).


## Debian


### Debian 10 (Buster)


#### Debian10 Php7.4 Cli: 7.4.11

This is the very base container, with only Debian 10 and Php 7.4.11.

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/debian10-php7.4-cli:7.4.11 php -v
```

#### Debian10 Php7.4 Utils: 7.4.11

This is the utils container, with Debian 10, Php 7.4.11, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/debian10-php7.4-utils:7.4.11 composer -v
```

#### Debian10 Php7.4 Apache Dev: 7.4.11

This is the development container, with Debian 10, Php 7.4.11, Apache 2.4.38 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: debian/10/php/7.4/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

#### Debian10 Php7.4 Apache Prod: 7.4.11

This is the production container, with Debian 10, Php 7.4.11, Apache 2.4.38 and Certbot to manage a grade A (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: debian/10/php/7.4/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Move and edit the <i>php.ini.example</i> file to the project directory folder and rename as <i>php.ini</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.


#### Debian10 Php7.3 Cli: 7.3.23

This is the very base container, with only Debian 10 and Php 7.3.23.

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/debian10-php7.3-cli:7.3.23 php -v
```

#### Debian10 Php7.3 Utils: 7.3.23

This is the utils container, with Debian 10, Php 7.3.23, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/debian10-php7.3-utils:7.3.23 composer -v
```

#### Debian10 Php7.3 Apache Dev: 7.3.23

This is the development container, with Debian 10, Php 7.3.23, Apache 2.4.38 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: debian/10/php/7.3/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

#### Debian10 Php7.3 Apache Prod: 7.3.23

This is the production container, with Debian 7, Php 7.3.23, Apache 2.4.38 and Certbot to manage a grade A (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: debian/10/php/7.2/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Move and edit the <i>php.ini.example</i> file to the project directory folder and rename as <i>php.ini</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.


#### Debian10 Php7.2 Cli: 7.2.34

This is the very base container, with only Debian 10 and Php 7.2.34.

The easiest way to test this container is to run one in your local machine, you can use the following command:
```bash
docker run --rm rdeleo/debian10-php7.2-cli:7.2.34 php -v
```

#### Debian10 Php7.2 Utils: 7.2.34

This is the utils container, with Debian 10, Php 7.2.34, composer and prestissimo.

The easiest way to test this container is to run one in your local machine, you can use the following command:

```bash
docker run --rm rdeleo/debian10-php7.2-utils:7.2.34 composer -v
```

#### Debian10 Php7.2 Apache Dev: 7.2.34

This is the development container, with Debian 10, Php 7.2.34, Apache 2.4.38 and XDebug.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Open the folder examples and target the environment you want to test: debian/10/php/7.2/apache/dev/
1. Move the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up
    ```   
1. Connect your browser to [localhost:8080](http://localhost:8080).

#### Debian10 Php7.2 Apache Prod: 7.2.34

This is the production container, with Debian 10, Php 7.2.34, Apache 2.4.38 and Certbot to manage a grade A (tested with https://www.ssllabs.com/ on the 2020-01-16) SSL certificate.

This containers is designed to be used with an orchestrator, to test it you should use docker-compose with the following instructions:
1. Ensure you're exposing the http and https ports (80 and 443)
1. Open the folder examples and target the environment you want to test: debian/10/php/7.2/apache/prod/
1. Move and edit the <i>docker-compose.template.yml</i> file to the project directory folder and rename as <i>docker-compose.yml</i>;
1. Move and edit the <i>.env.example</i> file to the project directory folder and rename as <i>.env</i>;
1. Move and edit the <i>php.ini.example</i> file to the project directory folder and rename as <i>php.ini</i>;
1. Run the following command:
    ```bash
    docker-compose.yml up -d
    ```   
1. Connect your browser to your domain name.
