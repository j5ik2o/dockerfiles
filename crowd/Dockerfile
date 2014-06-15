FROM j5ik2o/base-with-tomcat7

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ENV CROWD_VERSION 2.7.2
ENV TMP_DIR /tmp
ENV CROWD_HOME /var/lib/atlassian/crowd

ADD crowd.xml /tmp/

RUN curl -Lks http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${CROWD_VERSION}-war.zip -o ${TMP_DIR}/atlassian-crowd-${CROWD_VERSION}-war.zip

#RUN curl -Lks http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.31.zip -o ${TMP_DIR}/mysql-connector-java.zip

RUN cd ${TMP_DIR} &&\
  mkdir -p atlassian-crowd-${CROWD_VERSION}-war &&\
  cd atlassian-crowd-${CROWD_VERSION}-war && \
  unzip ../atlassian-crowd-${CROWD_VERSION}-war.zip

#  unzip mysql-connector-java.zip &&\
#  cp mysql-connector-java-5.1.31/mysql-connector-java-5.1.31-bin.jar ${TMP_DIR} &&\
#  chown root:root *.jar 

RUN /usr/sbin/useradd -d $CROWD_HOME -c "Account for running CROWD" -s /bin/bash crowd

RUN mkdir -p /var/lib/atlassian/crowd &&\
chown crowd:crowd /var/lib/atlassian/crowd &&\
chmod u+rwx /var/lib/atlassian/crowd  &&\
chmod g+rwx /var/lib/atlassian/crowd

RUN cd ${TMP_DIR}/atlassian-crowd-${CROWD_VERSION}-war/WEB-INF/classes && \
  echo "crowd.home = ${CROWD_HOME}" >> crowd-init.properties

RUN mv ${TMP_DIR}/atlassian-crowd-${CROWD_VERSION}-war ${TOMCAT_HOME}

RUN mkdir -p ${TOMCAT_HOME}/conf/Catalina/localhost && cp ${TMP_DIR}/crowd.xml ${TOMCAT_HOME}/conf/Catalina/localhost/

RUN chown crowd:crowd ${TOMCAT_HOME} && chown -R crowd:crowd ${TOMCAT_HOME}-${TOMCAT_VERSION}

#EXPOSE 8080

#VOLUME ["/opt/apache-tomcat/logs"]
#USER crowd

#CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
