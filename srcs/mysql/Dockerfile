FROM alpine:latest

EXPOSE 3306

RUN apk update && \
	apk upgrade && \
	apk add openrc && \
	apk add mariadb mariadb-client && \
	rm -vrf /var/cache/apk/*

VOLUME /sys/fs/cgroup
VOLUME /var/lib/mysql

COPY srcs/db.sql /etc/mysql/
COPY srcs/my.cnf /etc/mysql/
RUN chmod 444 /etc/mysql/my.cnf

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh /run.sh
