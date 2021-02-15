# Simple docker webserver with nginx, php-fpm, and sqlite

FROM nginx:latest
LABEL maintainer="m.d.mcnamara@gmail.com"
LABEL description="Simple docker webserver with nginx, php-fpm, and sqlite"

# Use bash for the shell
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y tzdata php-fpm php-sqlite3 \
    && apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

ARG WWW_CONF
ENV TZ=${TZ}

COPY 99-start-php-fpm.sh /docker-entrypoint.d/
COPY fastcgi_default /etc/nginx/
COPY ${WWW_CONF} /etc/nginx/conf.d/default.conf

# Add www-data group to nginx user so that nginx can access php-fpm socket
RUN usermod -a -G www-data nginx
