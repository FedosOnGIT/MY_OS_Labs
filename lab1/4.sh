#!/bin/bash
input=/home/fedos/OS\ Labs/lab1
if [[ "$PWD" == "$input" ]] 
then 
	echo "Correct"
	exit 0
else 
	echo "False"
	exit 1
fi
