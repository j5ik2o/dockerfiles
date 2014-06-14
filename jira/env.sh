NAME=jira

mkdir -p files/dl && cd files/dl
[ -e atlassian-jira-6.2.7-x64.bin ] || wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.2.7-x64.bin
#[ -e atlassian-jira-6.2.6-war.tar.gz ] || wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.2.6-war.tar.gz
#[ -e jira-jars-tomcat-distribution-6.1-tomcat-7x.zip ] || wget http://www.atlassian.com/software/jira/downloads/binary/jira-jars-tomcat-distribution-6.1-tomcat-7x.zip
#[ -e mysql-connector-java-5.1.31.zip ] || wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.31.zip
cd ../../
