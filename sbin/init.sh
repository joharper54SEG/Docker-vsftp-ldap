#! /bin/bash

set -x

# Generate dynamic configs from environment variables
confd -onetime -backend env

# Set permission required for nslcd
chmod 400 /etc/nslcd.conf

#Create DIRs and set permissions
install -m 760 -o root -g root -d /var/run/vsftpd/empty
install -m 760 -o svc_ftp -g svc_ftp -d /home/svc_ftp
install -m 760 -o svc_ftp -g svc_ftp -d /home/vftp
chmod 400 /etc/nslcd.conf

# Restart nslcd service, needed to pull in ldap users for some reason.  debug me later.
service nslcd restart

# Run vsftpd:
/usr/sbin/vsftpd /etc/vsftpd.conf

