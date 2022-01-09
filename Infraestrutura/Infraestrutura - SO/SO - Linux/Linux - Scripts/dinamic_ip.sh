#!/bin/bash

ip=$(host mtpfw.ddns.net | awk '{print $4}')
ip2=$(host $ip | awk '{print $5}' | sed 's/\.$//')
echo "vsftpd: localhost,$ip,$ip2" > /etc/hosts.allow
