#!/bin/sh

openrc default

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri
chown -R pdemocri:pdemocri /var/lib/nginx
chown -R pdemocri:pdemocri /var/www
chmod 755 /var/www
ssh-keygen -A

rc-service sshd start
rc-service nginx start
rc-service php-fpm7 start
# -g 'daemon off;'
# supervisord -c /etc/supervisor.conf

while [ true ]
do
    sshd_pid=$(ps aux | grep sshd | wc -l)
    nginx_pid=$(ps aux | grep nginx | wc -l)
    php_pid=$(ps aux | grep php-fpm7 | wc -l)
    if [ $sshd_pid == 0 ]
    then
        exit 1
    fi
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