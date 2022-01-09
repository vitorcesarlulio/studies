#!/bin/bash
set -x

# Aliases
VAR1=$(host VAR1.ddns.net | awk '{print $4}')
VAR12=$(host VAR12.ddns.net | awk '{print $4}')
VAR1cosmo=$(host VAR1cosmo.ddns.net | awk '{print $4}')
VAR3=$(host mtpfw.ddns.net | awk '{print $4}')
VAR4="191.13.138.172"

# Remove all Rick Rules
echo yes | cp -rf /opt/scripts/public.xml /etc/firewalld/zones/
firewall-cmd --reload

# SQL Server 1433 / tcp
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR1cosmo'" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR1'" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR12'" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR3'" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR4'" port protocol="tcp" port="1433" accept'

# FTP 20/21 / tcp
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR12'" port protocol="tcp" port="20-21" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR1'" port protocol="tcp" port="20-21" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR3'" port protocol="tcp" port="20-21" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR4'" port protocol="tcp" port="20-21" accept'

# MySQL 3306 / tcp
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR1'" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR12'" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR3'" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$VAR4'" port protocol="tcp" port="3306" accept'

# MySQL 3306 / tcp - APP VAR3
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="177.76.29.2" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="187.123.185.89" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="177.139.183.221" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="189.108.184.194" port protocol="tcp" port="3306" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="177.69.64.164" port protocol="tcp" port="3306" accept'

# SQL Server - Derpa / BI / Google
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="64.18.0.0/20" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="64.233.160.0/19" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="66.102.0.0/20" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="66.249.80.0/20" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="72.14.192.0/18" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="74.125.0.0/16" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="108.177.8.0/21" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="142.251.74.0/23" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="173.194.0.0/16" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="207.126.144.0/20" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="209.85.128.0/17" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="216.58.192.0/19" port protocol="tcp" port="1433" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="216.239.32.0/19" port protocol="tcp" port="1433" accept'

# Reload all
firewall-cmd --reload
