# Linux Bash Homework

## Task_A

### A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet. 
3. The --target key displays a list of open system TCP ports.
---
#### 1) First start a script:
````
#!/bin/bash
````
---
#### 2) Update our packet and download utility for use Ethernet:
sudo apt-get update
sudo apt-get install nmap
sudo apt-get install net-tools
---
#### 3) Create functions for our keys:

##### function for key "--all"
````
key_all()
{
        echo "Dispays the IP addresse and symbolic names of all hosts in the current subnet:"
        inet_ip=`(ifconfig | grep broadcast | awk '{print $2}')`
        sudo nmap -sn "$inet_ip"/20;
}
````

##### function for key "--target"
````
key_target()
{
        echo "Displays a list of open system TCP ports:"
        sudo ss -tlpn;
}
````
---
#### 4) Use operator if for different variables
````
if [[ "$1" == "--all" ]]; then
        key_all 
elif [[ "$1" == "--target" ]]; then
        key_target
else echo "'--all'  key displays the IP addresses and symbolic names of all hosts in the current subnet
'--target' key displays a list of open system TCP ports"
fi
````
---
### Final scripts looks
````
#!/bin/bash

sudo apt-get update
sudo apt-get install nmap
sudo apt-get install net-tools

key_all()
{
        echo "Dispays the IP addresse and symbolic names of all hosts in the current subnet:"
        inet_ip=`(ifconfig | grep broadcast | awk '{print $2}')`
        sudo nmap -sn "$inet_ip"/20;
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
````

