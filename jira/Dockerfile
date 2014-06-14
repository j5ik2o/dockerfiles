FROM base-with-tomcat7

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV JIRA_HOME /var/lib/atlassian/jira
ENV JIRA_VERSION 6.2.7
ENV JIRA_NAME atlassian-jira-${JIRA_VERSION}

ADD ${JIRA_NAME}-x64.bin /tmp/
ADD response.varfile /tmp/

RUN chmod /tmp/${JIRA_NAME}-x64.bin && cd /tmp && ./${JIRA_NAME}-x64.bin -q -varfile ./response.varfile

EXPOSE 8080

#USER jira


##CMD ["/bin/sh", "-e", "/opt/apache-tomcat/bin/catalina.sh", "run"]
