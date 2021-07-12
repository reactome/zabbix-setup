#! /bin/bash

# Some useful JMX queries can be found here: https://github.com/moxious/halin/tree/master/src/api/data/queries/jmx
QUERY_FILE=$1
# Not sure we want to expose the full path in github. Do `locate ogm.properties`, then view it to make sure it is correct before setting the value below.
PATH_TO_OGM_DOT_PROPERTIES=
#env_cmd=$(grep URI /var/lib/tomcat7/webapps/content/WEB-INF/classes/ogm.properties | sed -e 's/URI=http\:\/\/\(.*\)\:\(.*\)@.*:[0-9]*/env NEO4J_USER=\1 NEO4J_PASSWORD=\2/g')
U=$(grep URI $PATH_TO_OGM_DOT_PROPERTIES | sed -e 's/URI=http\:\/\/\(.*\)\:\(.*\)@.*:[0-9]*/\1/g')
P=$(grep URI $PATH_TO_OGM_DOT_PROPERTIES | sed -e 's/URI=http\:\/\/\(.*\)\:\(.*\)@.*:[0-9]*/\2/g')
env NEO4J_USERNAME=$U NEO4J_PASSWORD=$P cypher-shell < $QUERY_FILE
