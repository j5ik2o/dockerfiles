#!/bin/sh
 
docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql -t j5ik2o/mysql
