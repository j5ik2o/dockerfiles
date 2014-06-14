#!/bin/sh

docker run -i -v /var/log/jira:/opt/apache-tomcat/logs -p 8081:8080 -t j5ik2o/jira /bin/bash
