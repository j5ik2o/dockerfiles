#!/bin/sh

if [ -f /var/log/mysql ]; then
  mkdir -p /var/log/mysql
  chown ubuntu:ubuntu /var/log/mysql
fi

docker run -i -t j5ik2o/mysql /bin/bash
