FROM centos:7
MAINTAINER Myself <myself@example.com>

RUN yum -y  install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart

ADD index.html /var/www/html/
ADD httpd.conf /etc/httpd/conf/
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

#CMD ["/run-httpd.sh"]

CMD /usr/sbin/apachectl -D FOREGROUND
