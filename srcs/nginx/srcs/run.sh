#!/bin/sh

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri
chown -R pdemocri:pdemocri /var/lib/nginx
chown -R pdemocri:pdemocri /var/www
chmod 755 /var/www

ssh-keygen -A
php-fpm7
nginx -g 'daemon off;'

# touch /run/openrc/softlevel
# rc-update add nginx default
# rc-update add php-fpm7 default
