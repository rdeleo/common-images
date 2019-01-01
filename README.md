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