FROM alpine:latest

EXPOSE 5000

RUN apk update && \
	apk upgrade

RUN apk add wget
RUN apk add curl
RUN apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl &&\
	apk add php7-mbstring php7-json php7-session &&\
	rm -vrf /var/cache/apk/*

RUN mkdir -p /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.2-all-languages/ /var/www/phpmyadmin && \
	rm -r phpMyAdmin-5.0.2-all-languages.tar.gz

COPY /srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT ["./run.sh"]
# ENTRYPOINT sh /run.sh