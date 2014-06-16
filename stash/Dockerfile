FROM j5ik2o/base

MAINTAINER Junichi Kato <j5ik2o@gmail.com>

ADD setenv.sh /tmp/

ENV TMP_DIR /tmp
ENV STASH_VERSION 3.0.4
ENV STASH_HOME /var/lib/atlassian/stash
ENV TOMCAT_HOME /opt/atlassian-stash
ENV TOMCAT_VERSION $STASH_VERSION

# download
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz -o ${TMP_DIR}/atlassian-stash-${STASH_VERSION}.tar.gz 

RUN curl -Lks http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.31/mysql-connector-java-5.1.31.jar -o ${TMP_DIR}/mysql-connector-java-5.1.31.jar

# prepare for building
RUN cd ${TMP_DIR} &&\
 tar zxvf atlassian-stash-${STASH_VERSION}.tar.gz &&\
 chown root:root *.jar &&\
 chmod o+rwx *.jar &&\
 chmod g+rwx *.jar &&\
 chmod u+rwx *.jar

# create user
RUN /usr/sbin/useradd -d $STASH_HOME -c "Account for running STASH" -s /bin/bash stash

# install
RUN mkdir -p /opt && mv ${TMP_DIR}/atlassian-stash-${STASH_VERSION} /opt/

# tomcat configuration
RUN ln -s ${TOMCAT_HOME}-${TOMCAT_VERSION} ${TOMCAT_HOME}
RUN cp /tmp/setenv.sh ${TOMCAT_HOME}/bin/
RUN cp ${TMP_DIR}/*.jar ${TOMCAT_HOME}/lib
RUN chown stash:stash ${TOMCAT_HOME} && chown -R stash:stash ${TOMCAT_HOME}-${TOMCAT_VERSION}

# create home direactory
RUN mkdir -p ${STASH_HOME} &&\
chown stash:stash ${STASH_HOME} &&\
chmod u+rwx ${STASH_HOME}  &&\
chmod g+rwx ${STASH_HOME}

EXPOSE 8080 8009

VOLUME ["/opt/apache-tomcat/logs", "/var/lib/atlassian/stash"]

USER stash

CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
