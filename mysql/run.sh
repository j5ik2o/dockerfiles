#!/bin/sh

sudo docker run -v /var/lib/mysql:/var/lib/mysql -p 3306:3306 -t mysql
