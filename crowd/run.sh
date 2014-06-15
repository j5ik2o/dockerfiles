#!/bin/sh

if [ -f /var/log/atlassian/crowd ]; then
  mkdir -p /var/log/atlassian/crowd
  chown ubuntu:ubuntu /var/log/atlassian/crowd
fi
if [ -f /var/lib/atlassian/crowd ]; then
  mkdir -p /var/lib/atlassian/crowd
  chown ubuntu:ubuntu /var/lib/atlassian/crowd
fi

docker run -d -v /var/log/atlassian/crowd:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/crowd:/var/lib/atlassian/crowd \
-p 8080:8080 -t j5ik2o/crowd
