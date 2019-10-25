FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive \
apt-get install -y \
libpam-ldapd \
vsftpd

COPY confd-0.16.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

COPY etc/ /etc/
COPY sbin/ /sbin/

RUN useradd --uid 1000 --groups ftp --no-create-home --shell /bin/false svc_ftp
RUN chmod +x /sbin/init.sh     

EXPOSE 20 21 10100-10105

CMD [ "/sbin/init.sh" ]