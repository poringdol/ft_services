#!/bin/sh
openrc default

# influx -precision rfc3339
rc-service influxdb start
echo CREATE DATABASE telegraf | influx
# influxd -config /etc/influxdb.conf

rc-service telegraf start
telegraf --config etc/telegraf/telegraf.conf
