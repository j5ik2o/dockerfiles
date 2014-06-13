FROM base-with-tomcat7

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV JIRA_HOME /var/lib/atlassian/jira
ENV JIRA_VERSION 6.2.7
ENV JIRA_NAME atlassian-jira-${JIRA_VERSION}

ADD ./files/${JIRA_NAME}-war.tar.gz /tmp/
ADD ./files/jira-jars-tomcat-distribution-6.1-tomcat-7x.zip /tmp/
ADD ./jira-application.properties /tmp/
ADD ./jira.xml /tmp/
ADD ./server.xml.patch /tmp/
ADD ./setenv.sh /tmp/

RUN useradd --create-home --comment "Account for running JIRA" --shell /bin/bash jira

RUN mkdir -p ${JIRA_HOME}

RUN cp -f /tmp/jira-application.properties /tmp/${JIRA_NAME}-war/edit-webapp/WEB-INF/classes

RUN cd /tmp/${JIRA_NAME}-war && \
  sh build.sh && \
  mkdir -p /opt/atlassian/ && \
  cp /tmp/${JIRA_NAME}-war/dist-tomcat/${JIRA_NAME}.war /opt/atlassian/

RUN mkdir /tmp/tomcat7-update-jars && \
  cd /tmp/tomcat7-update-jars && \
  unzip ../jira-jars-tomcat-distribution-6.1-tomcat-7x.zip && \
  cp *.jar /opt/apache-tomcat/lib/

RUN mkdir -p ${TOMCAT_HOME}/conf/Catalina/localhost && \
  sed -e s/JIRA_NAME/${JIRA_NAME}/ /tmp/jira.xml > ${TOMCAT_HOME}/conf/Catalina/localhost/jira.xml

RUN cd ${TOMCAT_HOME}/conf && patch < /tmp/server.xml.patch && cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/

RUN chown -R jira ${JIRA_HOME} && chown -R jira /opt/apache-tomcat-7.0.54

EXPOSE 8080

USER jira

CMD ["/bin/sh", "-e", "/opt/apache-tomcat/bin/catalina.sh", "run"]