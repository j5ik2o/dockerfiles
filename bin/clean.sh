#!/bin/sh

set -e 

sudo mkdir -p /var/lib/mysql
sudo chown -R ubuntu:ubuntu /var/lib/mysql
sudo rm -fr /var/lib/mysql/*

sudo mkdir -p /var/log/mysql
sudo chown -R ubuntu:ubuntu /var/log/mysql
sudo rm -fr /var/log/mysql/*

sudo mkdir -p /var/log/nginx
sudo chown -R ubuntu:ubuntu /var/log/nginx
sudo rm -fr /var/log/nginx/*

for name in crowd jira confluence stash; do
	sudo mkdir -p /var/lib/atlassian/${name}
	sudo rm -fr /var/lib/atlassian/${name}/*
done
sudo chown -R ubuntu:ubuntu /var/lib/atlassian

for name in crowd jira confluence stash; do
	sudo mkdir -p /var/log/atlassian/${name}
	sudo rm -fr /var/log/atlassian/${name}/*
done
sudo chown -R ubuntu:ubuntu /var/log/atlassian
