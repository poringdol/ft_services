FROM alpine:latest

EXPOSE 80
EXPOSE 443
EXPOSE 22

RUN apk update && \
	apk upgrade

RUN apk add nginx && \
	apk add openrc && \
	apk add openssl && \
	apk add openssh &&  \
  # apk add supervisor && \
	apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl && \
	apk add php7-mbstring php7-json php7-session && \
	rm -vrf /var/cache/apk/*

VOLUME /sys/fs/cgroup

RUN mkdir -p /run/nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
# COPY srcs/supervisor.conf /etc/

COPY srcs/index.html /var/www/
COPY srcs/index.php /var/www/
COPY srcs/background.jpg /var/www/

RUN openssl req -newkey rsa:2048 -nodes -x509 -days 90 -subj \
        "/C=RU/ST=MO/L=Balaha/O=21school/OU=21/CN=pdemocri/emailAddress=pdemocri@student.21-school.ru" \
         -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/certs/localhost.key

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh
