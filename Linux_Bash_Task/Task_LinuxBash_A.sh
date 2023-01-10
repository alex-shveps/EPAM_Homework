#!/bin/bash

sudo apt-get update
sudo apt-get install nmap
sudo apt-get install net-tools


key_all()
{
        echo "Dispays the IP addresse and symbolic names of all hosts in the current subnet:"
        inet_ip=`(ifconfig | grep broadcast | awk '{print $2}')`
        sudo nmap -sn $inet_ip/20;
}

key_target()
{
        echo "Displays a list of open system TCP ports:"
        sudo ss -tlpn;
}

if [[ "$1" == "--all" ]]; then
        key_all 
elif [[ "$1" == "--target" ]]; then
        key_target
else echo "'--all'  key displays the IP addresses and symbolic names of all hosts in the current subnet
'--target' key displays a list of open system TCP ports"
fi
