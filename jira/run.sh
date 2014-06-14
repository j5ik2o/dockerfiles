#!/bin/sh

sudo docker run -d -p 8081:8080 -v /var/log/jira:/opt/apache-tomcat/logs -t jira
