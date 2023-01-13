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
		if [ $Path_synging_directory/$file -nt $Log_directory/$file ] ; then 
			cp -r $Path_synging_directory/$file $Log_directory/$file
			echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
		fi
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
    