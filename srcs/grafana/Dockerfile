FROM alpine:latest

EXPOSE 3000

RUN apk add rsync && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
	apk update && apk upgrade && \
	apk add openrc glibc-2.31-r0.apk && \
	wget https://dl.grafana.com/oss/release/grafana-7.0.6.linux-amd64.tar.gz && \
	tar -zxf grafana-7.0.6.linux-amd64.tar.gz && \
	rsync -av /grafana-7.0.6/ / && \
	rm -rf grafana-7.0.6.linux-amd64.tar.gz grafana-7.0.6

# COPY srcs/grafana.db /data/

ENTRYPOINT grafana-server
