#!/bin/sh

start() {
sudo docker run -d --name mysql -v /var/lib/mysql:/var/lib/mysql -v /var/log/mysql:/var/log/mysql -p 3306:3306 -t j5ik2o/mysql
}

stop() {
CID=`sudo docker ps | grep mysql | awk '{ print $1 }'`
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

