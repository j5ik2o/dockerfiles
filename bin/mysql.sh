#!/bin/sh
 
sudo docker run -d -v /var/lib/mysql:/var/lib/mysql -v /var/log/mysql:/var/log/mysql -p 3306:3306 -t j5ik2o/mysql
