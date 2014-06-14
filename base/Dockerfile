FROM ubuntu:14.04

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV JAVA_VERSION 7

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y git-core curl unzip patch sudo xmlstarlet \
  software-properties-common python-software-properties

# Install Java 7
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install oracle-java${JAVA_VERSION}-installer -y

ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}-oracle
ENV PATH $JAVA_HOME/bin:$PATH

RUN echo '* soft nofile 65536' >> /etc/security/limits.conf
RUN echo '* hard nofile 65536' >> /etc/security/limits.conf

