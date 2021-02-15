# simple-docker-webserver
Simple docker webserver with nginx, php-fpm, and sqlite

## Prerequisites
* git
* docker
* docker-compose

## Instructions
After installing prerequisites, proceed with instructions below.

#### Clone this repo and switch to the new webserver directory.
```
git clone https://github.com/M-D-M/simple-docker-webserver.git
cd simple-docker-webserver
```

#### Edit .env with values specific to your project, and create a .conf file
```
cp .env.sample .env
cp my_website.conf.sample my_website.conf
```

#### Finally, build the container and bring it up.
```
docker-compose build
docker-compose up -d
```
