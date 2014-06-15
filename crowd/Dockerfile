FROM j5ik2o/base-with-tomcat7

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ENV CROWD_VERSION 2.7.2
ENV TMP_DIR /tmp
ENV CROWD_HOME /var/lib/atlassian/crowd

ADD setenv.sh /tmp/
ADD crowd.xml /tmp/

# download
RUN curl -Lks http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${CROWD_VERSION}-war.zip -o ${TMP_DIR}/atlassian-crowd-${CROWD_VERSION}-war.zip
RUN curl -Lks http://central.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar -o ${TMP_DIR}/mail-1.4.7.jar
RUN curl -Lks http://central.maven.org/maven2/javax/transaction/jta/1.0.1B/jta-1.0.1B.jar -o ${TMP_DIR}/jta-1.0.1B.jar
RUN curl -Lks http://central.maven.org/maven2/javax/activation/activation/1.1/activation-1.1.jar -o ${TMP_DIR}/activation-1.1.jar

# prepare for building
RUN cd ${TMP_DIR} &&\
 mkdir -p atlassian-crowd-${CROWD_VERSION}-war &&\
 cd atlassian-crowd-${CROWD_VERSION}-war && \
 unzip ../atlassian-crowd-${CROWD_VERSION}-war.zip &&\
 cd .. &&\
 chown root:root *.jar &&\
 chmod o+rwx *.jar &&\
 chmod g+rwx *.jar &&\
 chmod u+rwx *.jar

# create user
RUN /usr/sbin/useradd -d $CROWD_HOME -c "Account for running CROWD" -s /bin/bash crowd

# install
RUN mv ${TMP_DIR}/atlassian-crowd-${CROWD_VERSION}-war ${TOMCAT_HOME}

# tomcat configuration
RUN cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/
RUN cp ${TMP_DIR}/*.jar ${TOMCAT_HOME}/lib
RUN cd ${TOMCAT_HOME}/atlassian-crowd-${CROWD_VERSION}-war/WEB-INF/classes && \
  echo "crowd.home = ${CROWD_HOME}" >> crowd-init.properties
RUN mkdir -p ${TOMCAT_HOME}/conf/Catalina/localhost &&\
 cp ${TMP_DIR}/crowd.xml ${TOMCAT_HOME}/conf/Catalina/localhost/
RUN chown crowd:crowd ${TOMCAT_HOME} && chown -R crowd:crowd ${TOMCAT_HOME}-${TOMCAT_VERSION}

# create home direactory
RUN mkdir -p ${CROWD_HOME} &&\
chown crowd:crowd ${CROWD_HOME} &&\
chmod u+rwx ${CROWD_HOME} &&\
chmod g+rwx ${CROWD_HOME}

EXPOSE 8080 8009

VOLUME ["/opt/apache-tomcat/logs", "/var/lib/atlassian/crowd"]

USER crowd

CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
