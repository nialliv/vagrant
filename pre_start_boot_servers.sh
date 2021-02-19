#!/bin/bash

echo "===================================="
echo "======= Starting boot script ======="
echo "===================================="
echo "=========== Strat update ==========="
echo "===================================="

ip_addr=$(ip route show | grep eth1 | awk '{print $9}')
index=$(echo $ip_addr | awk -F "." '{print $4}')

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "$ip_addr serv$index serv$index" >> /etc/hosts 
systemctl restart sshd.service

echo "===================================="
echo "======== Finish script boot ========"
echo "===================================="
