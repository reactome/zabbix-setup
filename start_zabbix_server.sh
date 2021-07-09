#! /bin/bash

docker run --name zabbix-server -p 8008:80 -p 10051:10051 -p 25:25 -e PHP_TZ=UTC -d zabbix/zabbix-appliance:ubuntu-4.4-latest
