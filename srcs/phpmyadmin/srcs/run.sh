#!/bin/sh

# rc-update add nginx default
# rc-update add php-fpm7 default
# rc-service php-fpm7 start
# sleep 60
php-fpm7 start
php --server 0.0.0.0:5000 --docroot var/www/phpmyadmin
