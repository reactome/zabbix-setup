This directory contains files for different hosts

For all of the hosts, in the zabbix_agentd.conf file, the "Server" key's value should be set to the _private_ IP address of the _Zabbix_ server.

Some types of monitoring may rely on configuring/enabling certain settings on a host.

For example: Apache2 status monitoring requires the enabling of the mod_status module. You can verify that it works with `apache2ctl status`
