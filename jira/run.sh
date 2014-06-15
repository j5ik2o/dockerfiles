#!/bin/sh

if [ -f /var/log/atlassian/jira ]; then
  mkdir -p /var/log/atlassian/jira
  chown ubuntu:ubuntu /var/log/atlassian/jira
fi
if [ -f /var/lib/atlassian/jira ]; then
  mkdir -p /var/lib/atlassian/jira
  chown ubuntu:ubuntu /var/lib/atlassian/jira
fi

docker run -d -v /var/log/atlassian/jira:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/jira:/var/lib/atlassian/jira \
-p 8081:8080 -t j5ik2o/jira
