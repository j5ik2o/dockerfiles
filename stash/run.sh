#!/bin/sh

if [ -f /var/log/atlassian/stash ]; then
  mkdir -p /var/log/atlassian/stash
  chown ubuntu:ubuntu /var/log/atlassian/stash
fi
if [ -f /var/lib/atlassian/stash ]; then
  mkdir -p /var/lib/atlassian/stash
  chown ubuntu:ubuntu /var/lib/atlassian/stash
fi

docker run -i -v /var/log/atlassian/stash:/opt/atlassian-stash/logs \
-v /var/lib/atlassian/stash:/var/lib/atlassian/stash \
-p 8083:7990 -t j5ik2o/stash
