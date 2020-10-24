#!/bin/sh

adduser -D -g 'pdemocri' pdemocri
echo -e "pdemocri\npdemocri" | passwd pdemocri

vsftpd etc/vsftpd/vsftpd.conf