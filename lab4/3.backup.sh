#!/bin/bash
cd ~
past=""
past_time=""
if [[ -f backup-time ]]
then
	past=$(cat backup-time | awk '{ print $1 }')
	past_time=$(cat backup-time | awk '{ print $2 }')
else
	past=$(date +%Y-%m-%d)
	past_time=$(date +%s)
fi
now=$(date +%Y-%m-%d)
now_time=$(date +%s)
distance=$(echo $now_time $past_time | awk '{ print ($1 - $2) / 60 / 60 / 24 }')
result=""
if (( $(awk 'BEGIN {print ("'$distance'" >= 7)}') )); then
    result="YES"
else 
    result="NO"
fi
if [[ !(-f backup-time) || ($result == "YES") ]]
then
	way=~/Backup-$now
	mkdir $way
	cd ~/source
	files=$(ls -1)
	echo "Date is" $now "directory" $way "was successfuly created" >> ~/backup-report
	echo "Files:" >> ~/backup-report
	for current in $files
	do
		cp -R $current $way
		echo $current >> ~/backup-report 
	done
	echo $now $now_time > ~/backup-time
else
	way=~/source/
	cd $way
	files=$(ls -1)
	cd ~/Backup-$past
	for current in $files
	do	
		if [[ -f $current ]]
		then
			sizeCurrent=$(wc -c $current | awk '{print $1}')
			sizeSource=$(wc -c $way$current | awk '{print $1}')
			if [[ $sizeCurrent -ne $sizeSource ]]
			then
				mv $current $current-$now
				cp -R $way$current ~/Backup-$past
				echo $current "was renamed into" $current-$now >> ~/backup-report
			fi
		else
			cp -R $way$current ~/Backup-$past
			echo $way$current >> ~/backup-report
		fi
	done
fi		

	
