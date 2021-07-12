The contents of this directory should be placed in /usr/share/tomcat7/jmxconfig

You will also need to create a file named "jmxremote.password" and place it in /usr/share/tomcat7/jmxconfig

It will look similar to jmxremote.access, but with the correct password:
```
monitorRole SomePassword
controlRole SomePassword
```
You will also need to update setenv.sh (/usr/share/tomcat7/bin/setenv.sh) to enable JMX monitoring.
```bash
# set this to the AWS private IP of the host
$PRIVATE_IP_ADDRESS=
export CATALINA_OPTS="-Xms5120M -Xmx10240M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/heapdump.bin \
 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=13579 -Dcom.sun.management.jmxremote.rmi.port=13578 \
 -Dcom.sun.management.jmxremote.authenticate=true \
 -Dcom.sun.management.jmxremote.password.file=/usr/share/tomcat7/jmxconfig/jmxremote.password -Dcom.sun.management.jmxremote.access.file=/usr/share/tomcat7/jmxconfig/jmxremote.access \
 -Djava.rmi.server.hostname=$PRIVATE_IP_ADDRESS  \
 -Dcom.sun.management.jmxremote.ssl=false \
 -Dcom.sun.management.jmxremote.registry.ssl=false \
 -Djavax.net.ssl.keyStore=/usr/share/tomcat7/keystore/prod.keystore -Djavax.net.ssl.keyStorePassword=$ReactomeJMXKeystorePassword -Djavax.net.ssl.keyStoreType=PKCS12 \
 -Djavax.net.ssl.trustStore=/usr/share/tomcat7/keystore/prod.truststore -Djavax.net.ssl.trustStorePassword=$ReactomeJMXTrustStorePassword -Djavax.net.ssl.trustStoreType=PKCS12 \
 -Dcom.sun.management.jmxremote.ssl.need.client.auth=false"
```

You can read more about enabling JMX remote here: https://tomcat.apache.org/tomcat-7.0-doc/monitoring.html#Enabling_JMX_Remote

You will also need to generate keys and certificates for JMX. Self-signed certificates should be fine. There are many guides on how to do this, here is one: https://docs.oracle.com/javadb/10.10.1.2/adminguide/cadminsslkeys.html#cadminsslkeys

...You might have noticed that `-Dcom.sun.management.jmxremote.ssl=false` and `-Dcom.sun.management.jmxremote.registry.ssl=false` and `-Dcom.sun.management.jmxremote.ssl.need.client.auth=false` in the command above. I've not had much luck enabling SSL for JMX. From what I can tell, it might be a problem with Tomcat. Upgrading tomcat, or (even better) moving to a new version of Tomcat might resolve this problem.
