FROM j5ik2o/nginx

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

#ADD nonssl.conf /etc/nginx/conf.d/
ADD atlassian.conf /etc/nginx/conf.d/

EXPOSE 80

VOLUME ["/var/log/nginx", "/etc/nginx"]

CMD ["nginx"]
