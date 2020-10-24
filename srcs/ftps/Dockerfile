FROM alpine:latest

EXPOSE 21

RUN apk update && apk upgrade && \
	apk add vsftpd && \
	apk add openssl

COPY srcs/vsftpd.conf  etc/vsftpd/

RUN openssl req -newkey rsa:2048 -nodes -x509 -days 90 -subj \
        "/C=RU/ST=MO/L=Balaha/O=21school/OU=21/CN=pdemocri/emailAddress=pdemocri@student.21-school.ru" \
         -out /etc/vsftpd/localhost.crt -keyout /etc/vsftpd/localhost.key

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh
