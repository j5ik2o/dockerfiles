#!/bin/sh

sudo docker run -d -v /var/log/nginx:/var/log/nginx -v /etc/nginx:/etc/nginx -p 80:80 -t j5ik2o/nginx-atlassian
