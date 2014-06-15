FROM j5ik2o/base-with-tomcat7

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ENV CONFLUENCE_VERSION 5.5.2
ENV TMP_DIR /tmp
ENV CONFLUENCE_HOME /var/lib/atlassian/confluence

ADD setenv.sh /tmp/
ADD server.xml.patch /tmp/
ADD confluence.xml /tmp/

# download
RUN curl -Lks http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONFLUENCE_VERSION}-war.tar.gz -o ${TMP_DIR}/atlassian-confluence-${CONFLUENCE_VERSION}-war.tar.gz
RUN curl -Lks http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.31.zip -o ${TMP_DIR}/mysql-connector-java.zip

# prepare for building
RUN cd ${TMP_DIR} &&\
 tar zxvf atlassian-confluence-${CONFLUENCE_VERSION}-war.tar.gz &&\
 unzip mysql-connector-java.zip &&\
 cp mysql-connector-java-5.1.31/mysql-connector-java-5.1.31-bin.jar ${TMP_DIR} &&\
 chown root:root *.jar &&\
 chmod o+rwx *.jar &&\
 chmod g+rwx *.jar &&\
 chmod u+rwx *.jar

# create user
RUN /usr/sbin/useradd -d $CONFLUENCE_HOME -c "Account for running CONFLUENCE" -s /bin/bash confluence


# build
RUN echo "confluence.home=${CONFLUENCE_HOME}" > ${TMP_DIR}/confluence-${CONFLUENCE_VERSION}/confluence/WEB-INF/classes/confluence-init.properties 
RUN cd ${TMP_DIR}/confluence-${CONFLUENCE_VERSION} && ./build.sh
RUN cp ${TMP_DIR}/confluence-${CONFLUENCE_VERSION}/dist/confluence-${CONFLUENCE_VERSION}.war ${TOMCAT_HOME}/atlassian-confluence-${CONFLUENCE_VERSION}.war

# tomcat configuration
RUN cd ${TOMCAT_HOME}/conf && patch < /tmp/server.xml.patch
RUN cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/
RUN cp ${TMP_DIR}/*.jar /opt/apache-tomcat/lib
RUN mkdir -p /opt/apache-tomcat/conf/Catalina/localhost &&\
 cp ${TMP_DIR}/confluence.xml ${TOMCAT_HOME}/conf/Catalina/localhost/
RUN chown confluence:confluence ${TOMCAT_HOME} && chown -R confluence:confluence ${TOMCAT_HOME}-${TOMCAT_VERSION}

# create home directory
RUN mkdir -p ${CONFLUENCE_HOME} &&\
 chown -R confluence:confluence ${CONFLUENCE_HOME} &&\
 chmod u+rwx ${CONFLUENCE_HOME} &&\
 chmod g+rwx ${CONFLUENCE_HOME} 

EXPOSE 8080 8009

VOLUME ["/opt/apache-tomcat/logs", "/var/lib/atlassian/confluence"]

USER confluence

CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
