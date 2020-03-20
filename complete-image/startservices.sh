#!/bin/bash
# If SQLSTREAM_JAVA_SECURITY_AUTH_LOGIN_CONFIG exist
if [ ! -z "$SQLSTREAM_JAVA_SECURITY_AUTH_LOGIN_CONFIG" ]
   then
   echo "SQLSTREAM_JAVA_SECURITY_AUTH_LOGIN_CONFIG=$SQLSTREAM_JAVA_SECURITY_AUTH_LOGIN_CONFIG" >> /etc/sqlstream/environment
fi

# If SQLSTREAM_JAVA_SECURITY_KRB5_CONF exist
if [ ! -z "$SQLSTREAM_JAVA_SECURITY_KRB5_CONF" ]
   then
   echo "SQLSTREAM_JAVA_SECURITY_KRB5_CONF=$SQLSTREAM_JAVA_SECURITY_KRB5_CONF" >> /etc/sqlstream/environment
fi
# s-server, webagent and streamlab started by fetch_and_start_project
# service s-serverd start 
#service webagentd start
service s-dashboardd start 
# service streamlabd start 
service lighttpd start
service postgresql start
service kafka start
source /etc/sqlstream/environment
CP=$SQLSTREAM_HOME/../clienttools/blaze/coverpage-service/
cd $SQLSTREAM_HOME/demo/coverpage/
gulp build &>/dev/null
service coverpaged start
cd /home/sqlstream
