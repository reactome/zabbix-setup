Zabbix files used on main Reactome Production server. The main Zabbix config file (/etc/zabbix/zabbix_agentd.conf) is not here, it gets created when you install the Zabbix agent.
All you need to do for that file is set the ServerActive value to the AWS _private_ IP address of the host, and set (optionally) set Hostname to the hostname.

Files in this directory should be placed in /etc/zabbix (unless otherwise indicated)

Systemd scripts were originally found here: https://github.com/MogiePete/zabbix-systemd-service-monitoring

SSL Certificate monitoring scripts were originally found here: https://github.com/selivan/https-ssl-cert-check-zabbix
