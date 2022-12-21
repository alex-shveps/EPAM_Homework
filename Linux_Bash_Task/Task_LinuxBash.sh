#!/bin/bash
sudo apt-get update
sudo apt-get install nmap
all()
{
        echo "Dispays the IP addresse and symbolic names of all hosts in the current subnet:"
        slep 5;
}
target()
{
        echo "Displays a list of open system TCP ports:"
        slep 5
        ;
}
if [[ "$1" == "--all" ]]; then
        all
elif [[ "$1" == "--target" ]]; then
        target
else echo "'--all'  key displays the IP addresses and symbolic names of all hosts in the current subnet
'--target' key displays a list of open system TCP ports"
fi
