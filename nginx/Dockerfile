FROM ubuntu:14.04

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN mkdir -p /etc/nginx/ssl
#ADD default /etc/nginx/sites-available/default
#ADD default-ssl /etc/nginx/sites-available/default-ssl
#ADD index.html /var/www/

EXPOSE 80

CMD ["nginx"]
