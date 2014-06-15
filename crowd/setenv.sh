export CATALINA_OPTS="$CATALINA_OPTS -Dversion=${CROWD_VERSION} -Dorg.apache.jasper.runtime.BodyContentImpl.LIMIT_BUFFER=true -Dmail.mime.decodeparameters=true -Xms1g -Xmx2g -XX:MaxPermSize=256m"
