#!/bin/sh

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri

nginx
php-fpm7

while [ true ]
do
    nginx_pid=$(ps aux | grep nginx | wc -l)
    php_pid=$(ps aux | grep php-fpm7 | wc -l)
    if [ $nginx_pid == 0 ]
    then
        exit 1
    fi
    if [ $php_pid == 0 ]
    then 
        exit 1
    fi
    sleep 30
done