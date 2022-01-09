#!/bin/bash

ip=$(host MEUIP | awk '{print $4}')
ip2=$(host $ip | awk '{print $5}' | sed 's/\.$//')
echo "sqlserver: localhost,$ip,$ip2" > /etc/hosts.allow
echo "mssql: localhost,$ip,$ip2" >> /etc/hosts.allow
