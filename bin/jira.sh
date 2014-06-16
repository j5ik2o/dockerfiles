#!/bin/sh

sudo docker run -d -v /var/log/atlassian/jira:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/jira:/var/lib/atlassian/jira \
-p 8081:8080 -t j5ik2o/jira
