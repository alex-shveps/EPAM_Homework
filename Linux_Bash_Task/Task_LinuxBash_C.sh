#!/bin/bash

Path_syngig_directory="$1"
Log_directory="$2"

if [ ! -d $1 ]; then
        mkdir $1
elif [ ! -d $2 ]; then
        mkdir $2nan
fi

Log=~/backup.log
for file in $(find $Path_syngig_directory -printf "%P\n") ; do
	if [ -a $Log_directory/$file ] ; then
		if [ $Path_syngig_directory/$file -nt $Log_directory/$file ] ; then 
			cp -r $Path_syngig_directory/$file $Log_directory/$file
			echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
		fi
	else
		cp -r $Path_syngig_directory/$file $Log_directory/$file
		echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
done

for file in $(find $Log_directory -printf "%P\n") ; do
	if [ -a $Path_syngig_directory/$file ] ; then
		sleep 0
	else 
    	rm -r $Log_directory/$file
    	echo "Remove $file $(date +'%d-%b-%Y %R')" >>$Log
	fi
done
    





for file in $(find $Path_syngig_directory -printf "%P\n") ; do
	cp -r $Path_syngig_directory/$file $Log_directory/$file
	echo "Copy $file $(date +'%d-%b-%Y %R')" >>$Log
done




else
	










file_before="$(ls -al $1)"
first_time=0

if [[ $first_time ==0 ]]; then
	file_after=$(ls -al $1)
elif [[ $first_time !=0 ]]; then
	file_before
$first_time+1
fi
echo "$file_after + $('%d-%b-%Y %R')" >>$Log

#echo >>$Log
#echo "$(date +'%d-%b-%Y %R')" >>$Log

