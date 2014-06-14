FROM ubuntu:14.04

MAINTAINER Junichi Kato j5ik2o@gmail.com

ENV JIRA_HOME /var/lib/atlassian/jira
ENV JIRA_VERSION 6.2.7
ENV JIRA_NAME atlassian-jira-${JIRA_VERSION}
ENV JIRA_USER jira

ADD ${JIRA_NAME}-x64.bin /tmp/
ADD response.varfile /tmp/

RUN chmod u+x /tmp/${JIRA_NAME}-x64.bin && cd /tmp && ./${JIRA_NAME}-x64.bin -q -varfile ./response.varfile

RUN chown -R jira /opt/atlassian/jira

EXPOSE 8080
VOLUME ["/opt/atlassian/jira/logs"]

CMD ["/opt/atlassian/jira/bin/start-jira.sh", "run"]
