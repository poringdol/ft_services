#!/bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

# create new database
mariadb -e "CREATE DATABASE db_wordpress;"
mariadb -e "CREATE USER 'pdemocri'@'%' IDENTIFIED BY 'pdemocri';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'pdemocri'@'%';"
# import database with site
mysql -u root db_wordpress < /etc/mysql/db.sql

rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'