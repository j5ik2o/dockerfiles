FROM j5ik2o/base-with-tomcat7

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ADD setenv.sh /tmp/
ADD server.xml.patch /tmp/
ADD jira.xml /tmp/

ENV JIRA_VERSION 6.1
ENV TMP_DIR /tmp
ENV JIRA_HOME /var/lib/atlassian/jira

RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}-war.tar.gz -o ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war.tar.gz
RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/jira-jars-tomcat-distribution-6.1-tomcat-7x.zip -o ${TMP_DIR}/jira-jars-distribution-tomcat.zip
RUN curl -Lks http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.31.zip -o ${TMP_DIR}/mysql-connector-java.zip

RUN cd ${TMP_DIR} &&\
  tar zxvf atlassian-jira-${JIRA_VERSION}-war.tar.gz &&\
  unzip jira-jars-distribution-tomcat.zip &&\
  unzip mysql-connector-java.zip &&\
  cp mysql-connector-java-5.1.31/mysql-connector-java-5.1.31-bin.jar ${TMP_DIR} &&\
  chown root:root *.jar 

RUN /usr/sbin/useradd -d $JIRA_HOME -c "Account for running JIRA" -s /bin/bash jira

RUN mkdir -p /var/lib/atlassian/jira &&\
chown jira:jira /var/lib/atlassian/jira &&\
chmod u+rwx /var/lib/atlassian/jira  &&\
chmod g+rwx /var/lib/atlassian/jira

RUN cd ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war/edit-webapp/WEB-INF/classes && \
  sed -i -e"s/jira\.home \= /jira\.home \= \/var\/lib\/atlassian\/jira/" jira-application.properties

RUN cd ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war && ./build.sh

RUN cp ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war/dist-tomcat/atlassian-jira-${JIRA_VERSION}.war /opt/apache-tomcat/

RUN chown -R jira:jira /opt/apache-tomcat-${TOMCAT_VERSION} &&\
cd ${TMP_DIR} &&\
chmod o+rwx *.jar &&\
chmod g+rwx *.jar &&\
chmod u+rwx *.jar

RUN cd /opt/apache-tomcat/lib &&\
rm -f slf4j-log4j12-*.jar &&\
rm -f slf4j-api-*.jar &&\
rm -f log4j-*.jar &&\
rm -f jul-to-slf4j-*.jar &&\
rm -f jcl-over-slf4j-*.jar

RUN cp ${TMP_DIR}/*.jar /opt/apache-tomcat/lib

#RUN mkdir -p /opt/apache-tomcat/conf/Catalina/localhost && \
#  cp ${TMP_DIR}/jira.xml ${TOMCAT_HOME}/conf/Catalina/localhost/

#  cp ${TMP_DIR}/atlassian-jira-${JIRA_VERSION}-war/etc/jira.xml ${TOMCAT_HOME}/conf/Catalina/localhost/ &&\
#  sed -i -e"s/@JIRA_WEBAPP@/\/opt\/apache-tomcat\/atlassian-jira-6.1.war/" ${TOMCAT_HOME}/conf/Catalina/localhost/jira.xml

RUN cd ${TOMCAT_HOME}/conf && patch < /tmp/server.xml.patch
RUN cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/

RUN chown jira:jira ${TOMCAT_HOME} && chown -R jira:jira /opt/apache-tomcat-${TOMCAT_VERSION}

EXPOSE 8080

VOLUME ["/opt/apache-tomcat/logs"]
USER jira

CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
