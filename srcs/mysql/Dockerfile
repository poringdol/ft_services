FROM alpine:latest

EXPOSE 3306

RUN apk update && \
	apk upgrade

RUN apk add mariadb mariadb-client

COPY srcs/localhost.sql /var/lib/mysql/

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT ["./run.sh"]
# ENTRYPOINT sh /run.sh
