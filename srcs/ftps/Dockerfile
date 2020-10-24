FROM alpine:latest

EXPOSE 21

RUN apk update && apk upgrade && \
	apk add vsftpd

COPY srcs/vsftpd.conf  etc/vsftpd/
COPY srcs/localhost.crt  /etc/ssl/certs/
COPY srcs/localhost.key /etc/ssl/certs/

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh
