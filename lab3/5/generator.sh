#!/bin/bash
mkfifo pipe
while true
do
	read input
	echo "$input" > pipe
	if [[ "$input" == "QUIT" ]] 
	then
		exit 0
	fi
	if ! [[ $input =~ $regular || "$input" == "+" || "$input" == "*" ]]
	then
		exit 1
	fi 
done
