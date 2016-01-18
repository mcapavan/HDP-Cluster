#!/bin/bash

yum -y install wget httpd ntp 
/etc/init.d/httpd start

#cp ~/conf/training-keypair.pem ~/.ssh/id_rsa
#chmod 700 ~/.ssh/id_rsa
#scp ~/.ssh/id_rsa node2:~/.ssh
#scp ~/.ssh/id_rsa node3:~/.ssh
#scp ~/.ssh/id_rsa node4:~/.ssh

chkconfig ntpd on
/etc/init.d/ntpd start

ssh -o StrictHostKeyChecking=no -f root@node2 "yum -y install ntp; chkconfig ntpd on; /etc/init.d/ntpd start"
ssh -o StrictHostKeyChecking=no -f root@node3 "yum -y install ntp; chkconfig ntpd on; /etc/init.d/ntpd start"
ssh -o StrictHostKeyChecking=no -f root@node4 "yum -y install ntp; chkconfig ntpd on; /etc/init.d/ntpd start"


setenforce 0
chkconfig iptables off
/etc/init.d/iptables stop 2> /dev/null > /dev/null

yum -y install yum-utils createrepo

mkdir -p /var/www/html
cd /var/www/html

echo "copying repo files to /var/www/html folder..."
cp -r /root/Downloads/repo/* .

createrepo /var/www/html/hdp/centos6/HDP-2.3.0.0
createrepo /var/www/html/hdp/centos6/HDP-UTILS-1.1.0.20
createrepo /var/www/html/ambari/centos6/Updates-ambari-2.1.0

cp ~/Downloads/conf/ambari.repo /etc/yum.repos.d/
cp ~/Downloads/conf/hdp.repo /etc/yum.repos.d/

~/scripts/distFile.sh /etc/yum.repos.d/hdp.repo /etc/yum.repos.d
~/scripts/distFile.sh /etc/yum.repos.d/ambari.repo /etc/yum.repos.d

yum -y install yum-priorities
ssh -o StrictHostKeyChecking=no -f root@node2 yum -y install yum-priorities
ssh -o StrictHostKeyChecking=no -f root@node3 yum -y install yum-priorities
ssh -o StrictHostKeyChecking=no -f root@node4 yum -y install yum-priorities

echo "[main]" > /etc/yum/pluginconf.d/priorities.conf
echo "enabled=1" >> /etc/yum/pluginconf.d/priorities.conf
echo "gpgcheck=0" >> /etc/yum/pluginconf.d/priorities.conf
/root/scripts/distFile.sh /etc/yum/pluginconf.d/priorities.conf /etc/yum/pluginconf.d
