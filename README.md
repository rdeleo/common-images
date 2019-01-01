# common-images
Docker common images

##1- Apache php image
- Build php 7.0 image
```
docker build --no-cache -t eclipsehv/apache-php:7.0 -f containers/apache-php/7.0/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/apache-php:7.0
```

- Build php 7.2 (latest) image
```
docker build --no-cache -t eclipsehv/apache-php:latest -f containers/apache-php/7.2/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/apache-php:latest
```
##2- Web Utils Container
- Build the image based on php 7.0
```
docker build --no-cache -t eclipsehv/web-utils:7.0 -f containers/web-utils/7.0/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/web-utils:7.0
```

- Build the image based on php 7.2 (latest)
```
docker build --no-cache -t eclipsehv/web-utils:latest -f containers/web-utils/7.2/Dockerfile .
```
- Push the image into Docker Hub registry
```
docker push eclipsehv/web-utils:latest
```