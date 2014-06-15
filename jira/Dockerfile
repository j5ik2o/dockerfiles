FROM j5ik2o/base-with-tomcat7

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ADD setenv.sh /tmp/
ADD server.xml.patch /tmp/
ADD jira.xml /tmp/

ENV JIRA_VERSION 6.1
ENV TMP_DIR /tmp
ENV JIRA_HOME /var/lib/atlassian/jira

# download
RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}-war.tar.gz -o ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war.tar.gz
RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/jira-jars-tomcat-distribution-6.1-tomcat-7x.zip -o ${TMP_DIR}/jira-jars-distribution-tomcat.zip
RUN curl -Lks http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.31.zip -o ${TMP_DIR}/mysql-connector-java.zip

# prepare for building
RUN cd ${TMP_DIR} &&\
 tar zxvf atlassian-jira-${JIRA_VERSION}-war.tar.gz &&\
 unzip jira-jars-distribution-tomcat.zip &&\
 unzip mysql-connector-java.zip &&\
 cp mysql-connector-java-5.1.31/mysql-connector-java-5.1.31-bin.jar ${TMP_DIR} &&\
 chown root:root *.jar &&\
 chmod o+rwx *.jar &&\
 chmod g+rwx *.jar &&\
 chmod u+rwx *.jar

# create user
RUN /usr/sbin/useradd -d $JIRA_HOME -c "Account for running JIRA" -s /bin/bash jira

# build
RUN echo "jira.home=$JIRA_HOME" > cd ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war/edit-webapp/WEB-INF/classes/jira-application.properties
RUN cd ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war && ./build.sh
RUN cp ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war/dist-tomcat/atlassian-jira-${JIRA_VERSION}.war ${TOMCAT_HOME}

# tomcat configuration
RUN cd ${TOMCAT_HOME}/lib &&\
rm -f slf4j-log4j12-*.jar &&\
rm -f slf4j-api-*.jar &&\
rm -f log4j-*.jar &&\
rm -f jul-to-slf4j-*.jar &&\
rm -f jcl-over-slf4j-*.jar
RUN cd ${TOMCAT_HOME}/conf && patch < /tmp/server.xml.patch
RUN cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/
RUN cp ${TMP_DIR}/*.jar /opt/apache-tomcat/lib
RUN mkdir -p /opt/apache-tomcat/conf/Catalina/localhost && \
  cp ${TMP_DIR}/jira.xml ${TOMCAT_HOME}/conf/Catalina/localhost/
RUN chown jira:jira ${TOMCAT_HOME} && chown -R jira:jira {$TOMCAT_HOME}-${TOMCAT_VERSION}

# create home direactory
RUN mkdir -p ${JIRA_HOME} &&\
chown jira:jira ${JIRA_HOME} &&\
chmod u+rwx ${JIRA_HOME}  &&\
chmod g+rwx ${JIRA_HOME}

EXPOSE 8080 8009

VOLUME ["/opt/apache-tomcat/logs", "/var/lib/atlassian/jira"]

USER jira

CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
