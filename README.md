# Docker-vsftp-ldap
vsftpd in a container with LDAP (active directory) authentication

I needed a container that would do FTP using active directory as its authentication.  These are the fruits of the effort.

This project is using confd as the method to steralize the configuration files and make it easy for me to dynamically adjust the configs without a full container rebuild. http://www.confd.io/

More details here: https://blog.jonathonharper.com/2019/10/25/ftp-docker-container-with-active-directory-authentication/
