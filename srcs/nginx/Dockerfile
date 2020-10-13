FROM alpine:latest

EXPOSE 80
EXPOSE 443
EXPOSE 22

RUN apk update && \
	apk upgrade

RUN apk add nginx && \
	apk add curl && \
	apk add openssl && \
	apk add openssh && \
	apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl && \
	apk add php7-openssl

RUN mkdir -p /run/nginx

COPY srcs/index.html /var/www/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY srcs/localhost.crt /etc/ssl/certs/
COPY srcs/localhost.key /etc/ssl/certs/

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT ["./run.sh"]
# ENTRYPOINT sh /run.sh
