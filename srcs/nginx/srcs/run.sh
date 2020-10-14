#!/bin/sh

adduser -D pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri
ssh-keygen -A
php-fpm7
nginx -g 'daemon off;'

# touch /run/openrc/softlevel
# rc-update add nginx default
# rc-update add php-fpm7 default