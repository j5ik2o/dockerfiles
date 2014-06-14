FROM j5ik2o/base

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV TOMCAT_VERSION 7.0.52
ENV TOMCAT_HOME /opt/apache-tomcat

RUN curl -Lks http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -o /tmp/apache-tomcat.tar.gz

RUN mkdir -p /opt && \
  cd /opt && \
  tar zxvf /tmp/apache-tomcat.tar.gz && \
  ln -s ${TOMCAT_HOME}-${TOMCAT_VERSION} ${TOMCAT_HOME}


