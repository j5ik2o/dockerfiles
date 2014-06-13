NAME=jira

mkdir -p files/dl && cd files/dl
[ -e atlassian-jira-6.2.7-war.tar.gz ] || wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.2.7-war.tar.gz
[ -e jira-jars-tomcat-distribution-6.1-tomcat-7x.zip ] || wget http://www.atlassian.com/software/jira/downloads/binary/jira-jars-tomcat-distribution-6.1-tomcat-7x.zip
cd ../../
