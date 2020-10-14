#!/bin/sh
rc default
/etc/init.d/mariadb setup
rc-service mariadb start

# create new database
mariadb -e "CREATE DATABASE db_wordpress;"
mariadb -e "CREATE USER 'pdemocri'@'localhost' IDENTIFIED BY 'pdemocri';"
mariadb -e "GRANT ALL PRIVILEGES ON db_wordpress.* TO 'pdemocri'@'localhost';"
# import database with site
mysql --user='pdemocri' --password='pdemocri' db_wordpress < '/etc/localhost.sql'

rc-service mariadb stop
mysqld_safe