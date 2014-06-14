#!/bin/sh

set -eu

BUILD_JIRA_WAR_PATH=/tmp/${JIRA_NAME}-war

useradd --create-home --comment "Account for running JIRA" --shell /bin/bash jira

mkdir -p ${JIRA_HOME}

install_mysql_connector_java() {
  cd /tmp 
  unzip mysql-connector-java-5.1.31.zip
  cp mysql-connector-java-5.1.31/mysql-connector-java-5.1.31-bin.jar ${BUILD_JIRA_WAR_PATH}/webapp/WEB-INF/lib
  cp -f /tmp/jira-application.properties ${BUILD_JIRA_WAR_PATH}/edit-webapp/WEB-INF/classes
}

build_install_jira() {
  cd ${BUILD_JIRA_WAR_PATH}
  sh build.sh 
  mkdir -p /opt/atlassian/ 
  cp ${BUILD_JIRA_WAR_PATH}/dist-tomcat/tomcat-6/${JIRA_NAME}.war /opt/atlassian/
}

install_updated_jars() {
  mkdir /tmp/tomcat7-update-jars
  cd /tmp/tomcat7-update-jars
  unzip ../jira-jars-tomcat-distribution-6.1-tomcat-7x.zip
  cp *.jar /opt/apache-tomcat/lib/
}

install_jira_xml() {
  mkdir -p ${TOMCAT_HOME}/conf/Catalina/localhost
  sed -e s/JIRA_NAME/${JIRA_NAME}/ /tmp/jira.xml > ${TOMCAT_HOME}/conf/Catalina/localhost/jira.xml
}

patch_server_xml() {
  cd ${TOMCAT_HOME}/conf
  patch < /tmp/server.xml.patch
  cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/
}

install_mysql_connector_java
build_install_jira
install_updated_jars
install_jira_xml
patch_server_xml

chown -R jira ${JIRA_HOME} 
chown -R jira /opt/apache-tomcat-7.0.54


