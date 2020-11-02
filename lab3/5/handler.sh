#!/bin/bash
res=1
operation="+"
regular='^[0-9]+$'
(tail -f pipe) |
while true; 
do
	read LINE;
	if [[ "$LINE" == "QUIT" ]]
	then	
		rm pipe
		echo "$res"
		echo "exit"
		killall tail
		exit 0
	fi
	if ! [[ $LINE =~ $regular || "$LINE" == "+" || "$LINE" == "*" ]];
	then
		rm pipe
		echo "error"
		exit 1
	fi
	if [[ $LINE =~ $regular ]]
	then
		if [[ $operation == "+" ]]
		then
			res=$(echo $res $LINE | awk '{print $1 + $2 }')
			echo "$res"
		else
			res=$(echo $res $LINE | awk '{print $1 * $2 }')
			echo "$res"
		fi
	else
		operation="$LINE"
	fi
done


