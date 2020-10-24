#!/bin/sh
openrc default

rc-service influxdb start
echo CREATE DATABASE telegraf | influx
# influxd -config /etc/influxdb.conf

# create new database
# influx -precision rfc3339
# CREATE DATABASE telegraf

rc-service telegraf start
telegraf --config etc/telegraf/telegraf.conf
