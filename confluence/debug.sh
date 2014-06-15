#!/bin/sh

if [ -f /var/log/atlassian/confluence ]; then
  mkdir -p /var/log/atlassian/confluence
  chown ubuntu:ubuntu /var/log/atlassian/confluence
fi

if [ -f /var/lib/atlassian/confluence ]; then
  mkdir -p /var/lib/atlassian/confluence
  chown ubuntu:ubuntu /var/lib/atlassian/confluence
fi

docker run -i -v /var/log/atlassian/confluence:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/confluence:/var/lib/atlassian/confluence \
-p 8082:8080 -t j5ik2o/confluence /bin/bash
