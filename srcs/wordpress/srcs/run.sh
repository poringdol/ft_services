#!/bin/sh

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri
# chown -R root:root /var/lib/nginx
# chown -R root:root /var/www/html

# find . -type f -exec chmod 664 {} +
# find . -type d -exec chmod 775 {} +
# chmod 660 wp-config.php

php-fpm7
nginx -g 'daemon off;'
# php -S 0.0.0.0:5050 -t /etc/wordpress
