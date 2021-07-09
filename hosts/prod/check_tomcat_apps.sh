#! /bin/bash

# make sure you add:
#  <role rolename="manager-script"/>
#  <user username="$TOMCATSCRIPTADMINUSER" password="$TOMCATSCRIPTADMINPASSWORD" roles="standard,manager-script" />
# To the <tomcat-users> part of your tomcat-users.xml file.


curl -s -u $TOMCAT_SCRIPT_ADMIN_USER:$TOMCAT_SCRIPT_ADMIN_PASSWORD http://localhost:8081/manager/text/list | grep ^/ | sed -e 's/^\([^:]*\):\([^:]*\).*/\1\t\2/'
