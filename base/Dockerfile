FROM ubuntu:14.04

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV JAVA_VERSION 7

RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update

RUN (echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java${JAVA_VERSION}-installer oracle-java${JAVA_VERSION}-set-default unzip patch

ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}-oracle
ENV PATH $JAVA_HOME/bin:$PATH

RUN echo '* soft nofile 65536' >> /etc/security/limits.conf

RUN echo '* hard nofile 65536' >> /etc/security/limits.conf

