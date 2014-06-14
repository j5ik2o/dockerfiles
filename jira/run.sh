#!/bin/sh

sudo docker run -p 8081:8080 -v /var/log/jira:/opt/atlassian/jira/logs -t jira
