#!/bin/sh
echo "Default routes"
ip route flush all
echo "Default NICs"
rm /etc/network/interfaces
touch /etc/network/interfaces
echo "auto enp0s3" >> /etc/network/interfaces
echo "iface enp0s3 inet dhcp" >> /etc/network/interfaces
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "Default iptables rules"
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
echo "auto vlan1102" >> /etc/network/interfaces
echo "iface vlan1102 inet static" >> /etc/network/interfaces
echo "address 192.168.175.104" >> /etc/network/interfaces
echo "netmask 255.255.252.0" >> /etc/network/interfaces
echo "vlan_raw_device enp0s3" >> /etc/network/interfaces
echo "Rebooting"
sleep 1
reboot
