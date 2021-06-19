#!/bin/bash
clear

echo -e "##########################################################################"
echo -e "#               Bang ArieL                                               #"
echo -e "#               Unknown Ninja, I hate hypocrisy in friendship :)         #"
echo -e "##########################################################################"

echo ""
echo -e "Make sure you have internet connection to install packages..."
echo ""
echo -e "Press key enter"
read presskey

# Disable Selinux & Firewall

echo -e "[INFO] : Configuring Firewall & Selinux"
sleep 2
sed -i s/'SELINUX='/'#SELINUX='/g /etc/selinux/config
echo 'SELINUX=disabled' >> /etc/selinux/config
setenforce 0
service firewalld stop
service iptables stop
service ip6tables stop
systemctl disable firewalld
systemctl disable iptables
systemctl disable ip6tables
systemctl stop NetworkManager
systemctl disable NetworkManager

# Configuring network, /etc/hosts and resolv.conf

echo ""
echo -e "[INFO] : Configuring /etc/hosts"
echo ""
echo -n "Hostname. Example mail : "
read HOSTNAME
echo -n "Domain name. Example arielganteng.com : "
read DOMAIN
echo -n "IP Address : "
read IPADDRESS
echo ""

# /etc/hosts

cp /etc/hosts /etc/hosts.backup

echo "127.0.0.1       localhost" > /etc/hosts
echo "$IPADDRESS   $HOSTNAME.$DOMAIN       $HOSTNAME" >> /etc/hosts

# Change Hostname
hostnamectl set-hostname $HOSTNAME.$DOMAIN

# Disable service sendmail or postfix

systemctl stop sendmail
systemctl stop postfix
systemctl stop NetworkManager
systemctl disable sendmail
systemctl disable postfix
systemctl disable NetworkManager



# Update repo and install package needed by Zimbra

yum update -y
yum upgrade -y
yum -y install perl perl-core wget screen w3m elinks openssh-clients openssh-server bind bind-utils unzip nmap sed nc sysstat libaio rsync telnet aspell net-tools vim

# Restart Network
service network restart

echo ""
echo "Configuring Firewall, network, /etc/hosts and DNS server has been finished. your server is ready "
