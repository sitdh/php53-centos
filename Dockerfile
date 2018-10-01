FROM centos:6

RUN yum -y update && yum clean all
RUN yum -y install php-fpm php-gd php-mbstring php-mysql php-pecl-apc \
  php-pecl-memcache php-process php-xml php-common httpd \
  && yum clean all
RUN mkdir -p /var/www/html
RUN service httpd start
RUN service httpd restart

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
