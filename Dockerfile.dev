FROM centos:6

RUN yum -y update && yum clean all
RUN yum install centos-release-scl -y
RUN yum install httpd24 -y && yum clean all
RUN yum -y install php5 php-fpm php-gd php-mbstring php-mysql \
  php-pecl-apc php-process php-xml php-common php-pecl-memcache && \
  yum clean all

RUN scl enable httpd24 bash
COPY ./conf/server.conf /opt/rh/httpd24/root/etc/httpd/conf.d/server.conf
RUN ln -s /opt/rh/httpd24/root/etc/httpd /etc/httpd

RUN mkdir -p /var/www/html
COPY ./conf/script.sh /usr/local/bin/service-startup
RUN chmod a+x /usr/local/bin/service-startup

EXPOSE 80

ENTRYPOINT ["service-startup"]
