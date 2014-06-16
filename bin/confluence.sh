#!/bin/sh

sudo docker run -d -v /var/log/atlassian/confluence:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/confluence:/var/lib/atlassian/confluence \
-p 8082:8080 -t j5ik2o/confluence
