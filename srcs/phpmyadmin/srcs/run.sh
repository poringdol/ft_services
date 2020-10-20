#!/bin/sh

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri
chown -R pdemocri:pdemocri /var/lib/nginx
chown -R pdemocri:pdemocri /var/www

php-fpm7
nginx -g 'daemon off;'
# php --server 0.0.0.0:5000 --docroot var/www/phpmyadmin
