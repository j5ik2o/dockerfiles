FROM base

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV TOMCAT_VERSION 7.0.54
ENV TOMCAT_HOME /opt/apache-tomcat

ADD apache-tomcat-${TOMCAT_VERSION}.tar.gz /tmp

RUN mkdir -p /opt && \
  mv /tmp/apache-tomcat-${TOMCAT_VERSION} /opt && \
  ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME}


