FROM alpine:latest

EXPOSE 80
EXPOSE 443
EXPOSE 22

RUN apk update && \
	apk upgrade && \
	apk add openrc && \
	apk add mariadb mariadb-client && \
	rm -vrf /var/cache/apk/*


VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/var/lib/mysql" ]
COPY srcs/mysql/srcs/localhost.sql /var/lib/mysql/
COPY srcs/mysql/srcs/my.cnf /etc/mysql/