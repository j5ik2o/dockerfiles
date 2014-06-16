#!/bin/sh

sudo docker run -d -v /var/log/atlassian/crowd:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/crowd:/var/lib/atlassian/crowd \
-p 8080:8080 -t j5ik2o/crowd
