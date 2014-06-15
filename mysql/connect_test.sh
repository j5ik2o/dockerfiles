#!/bin/sh

CID=$(docker ps | grep "j5ik2o/mysql" | awk '{print $1}')
IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $CID)
mysql -u admin -p -h $IP
