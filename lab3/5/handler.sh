#!/bin/bash
result=1
operation="+"
regular='^[[:digit:]]+$'
(tail -f pipe) |
while true
do
	read input
	if [[ "$input" == "QUIT" ]]
	then
		echo "$result"
		echo "exit"
		rm pipe
		killall tail
		exit 0
	fi
	if ! [[ $input =~ $regular || "$input" == "+" || "$input" == "*" ]]
	then
		echo "error"
		rm pipe
		killall tail
		exit 1
	else
		if [[ $input =~ $regular ]]
		then
			if [[ "$operation" == "+" ]]
			then
				result=$(echo "$result" "$input" | awk '{ print $1 + $2 }')
			else
				result=$(echo "$result" "$input" | awk '{ print $1 * $2 }')
			fi
		else
			operation="$input"
		fi
	fi
done
 
		
