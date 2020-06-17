FROM centos

COPY bootstrap.cgi /tmp/

RUN yum -y update \
 && yum -y install openssl pciutils wget \
 && bash /tmp/bootstrap.cgi \
 && yum install -y srvadmin-idracadm7.x86_64 -y \
 && ln -s /usr/lib64/libssl.so.1.0.2k /usr/lib64/libssl.so \
 && yum -y clean all

COPY boot-from-iso.sh /boot-from-iso.sh
#ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
ENTRYPOINT ["/boot-from-iso.sh"]
