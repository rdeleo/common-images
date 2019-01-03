# common-images
Docker common images

## Apache php 7.0

### Build prod
```
docker build --no-cache -t eclipsehv/apache-php:7.0-prod -f containers/apache-php/7.0-prod/Dockerfile .
```
### Push the prod image into Docker Hub registry
```
docker push eclipsehv/apache-php:7.0-prod
```
### Build dev
```
docker build --no-cache -t eclipsehv/apache-php:7.0-dev -f containers/apache-php/7.0-dev/Dockerfile .
```
### Push the dev image into Docker Hub registry
```
docker push eclipsehv/apache-php:7.0-dev
```
### Usage of the dev
- Extend the image and within your docker-entrypoint you have to call the script ```/usr/bin/init_xdebug```
- Remember to set the env variable ```DOCKER_HOST_IP``` with your host ip

## Apache php 7.2 latest

### Build prod
```
docker build --no-cache -t eclipsehv/apache-php:7.2-prod -t eclipsehv/apache-php:latest -f containers/apache-php/7.2-prod/Dockerfile .
```
### Push the prod image into Docker Hub registry
```
docker push eclipsehv/apache-php:7.2-prod
```
### Build dev
```
docker build --no-cache -t eclipsehv/apache-php:7.2-dev -f containers/apache-php/7.2-dev/Dockerfile .
```
### Push the dev image into Docker Hub registry
```
docker push eclipsehv/apache-php:7.2-dev
```
### Usage of the dev
- Extend the image and within your docker-entrypoint you have to call the script ```/usr/bin/init_xdebug```
- Remember to set the env variable ```DOCKER_HOST_IP``` with your host ip

## Web Utils Container
- Build the image based on php 7.2 (latest)
```
docker build --no-cache -t eclipsehv/web-utils:7.2-prod -t eclipsehv/web-utils:latest -f containers/web-utils/7.2/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/web-utils:latest
```