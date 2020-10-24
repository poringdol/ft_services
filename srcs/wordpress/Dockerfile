FROM alpine:latest

EXPOSE 5050 

RUN apk update && \
	apk upgrade

RUN apk add wget && \
	apk add nginx && \
	apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl && \
	apk add php7-mbstring php7-json php7-session && \
	rm -vrf /var/cache/apk/*

RUN mkdir -p /run/nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/wordpress/
COPY srcs/php_version.php /var/www/wordpress/
COPY srcs/php_test.php /var/www/wordpress/
RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz && \
	tar -C /var/www/wordpress/ -xf latest-ru_RU.tar.gz --strip-components 1 && \
	rm -rf latest-ru_RU.tar.gz
COPY srcs/wp-config.php var/www/wordpress/
RUN rm var/www/wordpress/wp-content/themes/twentyseventeen/assets/images/header.jpg
COPY srcs/header.jpg var/www/wordpress/wp-content/themes/twentyseventeen/assets/images/

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh