FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server pwgen
 
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
 
ADD ./startup.sh /opt/startup.sh
 
EXPOSE 3306

VOLUME ["/var/lib/mysql", "/etc/mysql"]

USER mysql
 
#CMD ["/bin/bash", "/opt/startup.sh"]

