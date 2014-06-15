#!/bin/sh

if [ -f /var/log/crowd ]; then
  mkdir -p /var/log/crowd
  chown ubuntu:ubuntu /var/log/crowd
fi

docker run -i -v /var/log/crowd:/opt/apache-tomcat/logs -p 8080:8080 -t j5ik2o/crowd /bin/bash
