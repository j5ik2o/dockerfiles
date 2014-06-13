FROM ubuntu:14.04

MAINTAINER Junichi Kato j5ik2o@gmail.com

RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update

RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java8-installer oracle-java8-set-default unzip patch

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $JAVA_HOME/bin:$PATH

RUN echo '* soft nofile 65536' >> /etc/security/limits.conf

RUN echo '* hard nofile 65536' >> /etc/security/limits.conf

