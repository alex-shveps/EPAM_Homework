# Linux Bash Homework

## Task_A

### A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet. 
3. The --target key displays a list of open system TCP ports.
---
#### First start a script:
````Bash
#!/bin/bash
````
---
#### Update our packet and download utility for use Ethernet:
````Bash
sudo apt-get update
sudo apt-get install nmap
sudo apt-get install net-tools
````
---
#### Create functions for our keys:

##### function for key "--all"
````Bash
key_all()
{
        echo "Dispays the IP addresse and symbolic names of all hosts in the current subnet:"
        inet_ip=`(ifconfig | grep broadcast | awk '{print $2}')`
        sudo nmap -sn "$inet_ip";
}
````
##### find IP current subnet
````Bash
 inet_ip=`(ifconfig | grep broadcast | awk '{print $2}')
````
---

##### use nmap to display all host in the current subnet
````Bash
sudo nmap -sn "$inet_ip";
````
---
##### function for key "--target"
````Bash
key_target()
{
        echo "Displays a list of open system TCP ports:"
        sudo ss -tlpn;
}
````
---
##### use ss to show all open TCP ports
````Bash
sudo ss -tlpn;
````
---
#### Use operator if for different variables
````Bash
if [[ "$1" == "--all" ]]; then
        key_all 
elif [[ "$1" == "--target" ]]; then
        key_target
else echo "'--all'  key displays the IP addresses and symbolic names of all hosts in the current subnet
'--target' key displays a list of open system TCP ports"
fi
````
---
### Final script looks
````Bash
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

## Task_B

### B. Using Apache log example create a script to answer the following questions:

#### First start a script:
````Bash
#!/bin/bash
````
---
#### In variables write name of log_file:
````Bash
logs=$1
````
---
#### Answer a question: "1. From which ip were the most requests?" 
````Bash
echo "1. From which ip were the most requests? "
sleep 2
awk '{print $1}' $logs | sort | uniq -c | sort -r | awk '{print $2}' | head -1
````
---
#### Answer a question: "2. What is the most requested page?"
````Bash
echo "2. What is the most requested page?"    
sleep 2
grep 'GET' $logs | awk '{print $6, $7, $8}' | sort | uniq -c | sort -r | head -1 | awk '{print $2 $3 $4}'
````
---
#### Answer a question: "3. How many requests were there from each ip?"
````Bash
echo "3. How many requests were there from each ip?"
sleep 2
awk '{print $1}' $logs | sort | uniq -c | sort -k1 -r | awk '{print "Sum requests: " $1, " = ", $2}'
````
---
#### Answer a question: "4. What non-existent pages were clients referred to?"
````Bash
echo "4. What non-existent pages were clients referred to?"
sleep 2
grep 'error404' $logs | awk '{print $6, $7, $8}'
````
---
#### Answer a question: "5. What time did site get the most requests?"
````Bash
echo "5. What time did site get the most requests?"
sleep 2
awk '{print $4 }' $logs | sort | uniq -c | sort -r | awk '{print $2 }' | head
````
---
#### Answer a question: "6. What search bots have accessed the site? (UA + IP)"
````Bash
echo "6. What search bots have accessed the site? (UA + IP)"
sleep 2
awk '{print $1, $NF}' $logs | grep -E 'bot|bots' | grep -v 'robots' | sort -r | uniq
````
## Task_C

### C. Create a data backup script that takes the following data as parameters:

#### First start a script:
````Bash
#!/bin/bash
````
---
#### Set the PATH to the syncing directory:
````Bash
Path_synging_directory="$1"
````
---
#### Set the PATH to the directory where the copies of the files will be stored:
````Bash
Log_directory="$2"
````
---
#### ??reate directories then put in variables if they are missing:
````Bash
if [ ! -d $1 ]; then
        mkdir $1
elif [ ! -d $2 ]; then
        mkdir $2
fi
````
---
#### Create log_file in home directories:
````Bash
Log=~/backup.log
````
---
#### Using the for loop, we will display all the files in the syncing directory:
````Bash
for file in $(find $Path_synging_directory -printf "%P\n") ; do
````
---
#### Using the if statement, select all the same files in the backup directory, and copy the missing ones, if use -cp command write Copy, name_file and date in log_file:
````Bash
if [ -a $Log_directory/$file ] ; then
		sleep 0
	else
		cp -r $Path_synging_directory/$file $Log_directory/$file
		echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
````
---
#### Using the for loop, that chek delete file in the syncing, if use -rm command write Remove, name_file and date in log_file:
````Bash
for file in $(find $Log_directory -printf "%P\n") ; do
	if [ -a $Path_synging_directory/$file ] ; then
		sleep 0
	else 
    	rm -r $Log_directory/$file
    	echo "Remove $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
done
````
----
#### The command to run the script must be added to crontab with a run frequency of one minute
![](crontab.png)

---
### Final script looks
````Bash
#!/bin/bash

Path_synging_directory="$1"
Log_directory="$2"

if [ ! -d $1 ]; then
        mkdir $1
elif [ ! -d $2 ]; then
        mkdir $2
fi

Log=~/backup.log

for file in $(find $Path_synging_directory -printf "%P\n") ; do
	if [ -a $Log_directory/$file ] ; then
		sleep 0
	else
		cp -r $Path_synging_directory/$file $Log_directory/$file
		echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
done

for file in $(find $Log_directory -printf "%P\n") ; do
	if [ -a $Path_synging_directory/$file ] ; then
		sleep 0
	else 
    	rm -r $Log_directory/$file
    	echo "Remove $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
done
````