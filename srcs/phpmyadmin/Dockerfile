FROM alpine:latest

EXPOSE 5000

RUN apk update && \
	apk upgrade

RUN	apk add wget && \
	apk add nginx && \
	apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl && \
	apk add php7-mbstring php7-json php7-session && \
	rm -vrf /var/cache/apk/*

RUN mkdir -p /run/nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -C /var/www/phpmyadmin/ -xf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components 1 && \
	rm -r phpMyAdmin-5.0.2-all-languages.tar.gz

COPY /srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh