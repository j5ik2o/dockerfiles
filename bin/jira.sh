#!/bin/sh

start(){
sudo docker run -d --name jira -v /var/log/atlassian/jira:/opt/apache-tomcat/logs \
-v /var/lib/atlassian/jira:/var/lib/atlassian/jira \
-p 8081:8080 -t j5ik2o/jira
}

stop() {
CID=`sudo docker ps | grep jira | awk '{ print $1 }'`
sudo docker stop $CID
}

case "$1" in
start)
	start
	;;
stop)
	stop
	;;
esac

