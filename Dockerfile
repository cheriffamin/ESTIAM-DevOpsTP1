FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common && \
add-apt-repository ppa:ondrej/php && apt-get update

RUN apt-get install -y --allow-unauthenticated php5.6 php5.6-mysql php5.6-mcrypt php5.6-cli php5.6-gd php5.6-curl mysql-server

RUN a2enmod php5.6
RUN a2enmod rewrite

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ENV MYSQL_ROOT_PASSWORD: "amine"
ENV MYSQL_DATABASE: "mydb"
ENV MYSQL_USER: "root"

ADD db.sql /db.sql
RUN chmod 775 /db.sql 

EXPOSE 80

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh 

ADD index.php /var/www/index.php

CMD ["/entrypoint.sh"]