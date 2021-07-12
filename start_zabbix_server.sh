#! /bin/bash

# Make sure that the server running Zabbix has Apache configured to forward traffic from port 443 (or 80 if you have not secured the server) to 8008 (as shown below).
# Port 10051 is a port that Zabbix uses to communicate with Zabbix agents.
# Port 25 is for mail.
# Setting PHP_TZ to UTC sets the timezone of the server to be UTC.
docker run --name zabbix-server -p 8008:80 -p 10051:10051 -p 25:25 -e PHP_TZ=UTC -d zabbix/zabbix-appliance:ubuntu-4.4-latest
