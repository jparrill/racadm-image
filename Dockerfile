FROM centos

COPY bootstrap.cgi /tmp/

RUN yum -y update \
 && yum -y install openssl openssl-devel pciutils wget \
 && bash /tmp/bootstrap.cgi \
 && yum install -y srvadmin-idracadm7.x86_64 -y \
 && yum -y clean all

COPY boot-from-iso.sh /boot-from-iso.sh
#ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
ENTRYPOINT ["/boot-from-iso.sh"]
