#! /bin/bash

# This script is needed to run the Zabbix Java gateway, which is used when monitoring JMX items on hosts.

#"Binds": [
#                "/home/ubuntu/ZabbixKeyStore.key:/etc/zabbix/ZabbixKeyStore.key",
#                "/home/ubuntu/ZabbixTrustStore.key:/etc/zabbix/ZabbixTrustStore.key"
#            ],

# If you want to use SSL for JMX, be sure to set $zabbixKeystoreServer
# and $zabbixTruststorePassword before running this script. You will need to generate a key store and trust store for Zabbix.
# See https://www.zabbix.com/documentation/4.4/manual/config/items/itemtypes/jmx_monitoring?s%5B%5D=jmx
# and https://docs.oracle.com/javase/1.5.0/docs/guide/management/agent.html
# and https://docs.oracle.com/javase/1.5.0/docs/tooldocs/solaris/keytool.html#EXAMPLES
JAVA_OPTIONS="-Djavax.net.ssl.keyStore=/etc/zabbix/ZabbixKeyStore.key -Djavax.net.ssl.keyStorePassword=$zabbixKeystoreServer -Djavax.net.ssl.trustStore=/etc/zabbix/ZabbixTrustStore.key -Djavax.net.ssl.trustStorePassword=$zabbixTruststorePassword -Djavax.net.ssl.keyStoreType=pkcs12 -Djavax.net.ssl.trustStoreType=pkcs12 -Dcom.sun.jndi.rmi.factory.socket=javax.rmi.ssl.SslRMIClientSocketFactory"

docker run --name zabbix-java-gateway \
        --hostname zabbix-java-gateway \
        --link zabbix-server:zabbix-server \
        -p 10052:10052 \
        -e JAVA_OPTIONS="$JAVA_OPTIONS" \
        -v $(pwd)/ZabbixKeyStore.key:/etc/zabbix/ZabbixKeyStore.key \
        -v $(pwd)/ZabbixTrustStore.key:/etc/zabbix/ZabbixTrustStore.key  \
        -d zabbix/zabbix-java-gateway:ubuntu-4.4-latest
