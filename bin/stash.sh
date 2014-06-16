#!/bin/sh

sudo docker run -d -v /var/log/atlassian/stash:/opt/atlassian-stash/logs \
-v /var/lib/atlassian/stash:/var/lib/atlassian/stash \
-p 8083:7990 -t j5ik2o/stash
