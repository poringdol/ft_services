FROM alpine:latest

EXPOSE 8086

RUN apk update && \
	apk upgrade && \
	apk add openrc && \
	apk add influxdb && \
	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
	mkdir -p etc/telegraf && \
	rm -vrf /var/cache/apk/*

COPY srcs/telegraf.conf etc/telegraf/
COPY srcs/influxdb.conf etc/

VOLUME /var/lib/influxdb
VOLUME /sys/fs/cgroup

COPY srcs/run.sh /
RUN chmod 777 run.sh
ENTRYPOINT sh run.sh
