#!/bin/bash
if [[ $# -ne 1 ]]
then
	echo "wrong number of arguments"
	exit 1
fi
input=$1
trash=~/trash
if ! [[ -d "$trash" ]]
then 
	mkdir "$trash"
fi
if ! [[ -f "$input" ]]
then 
	echo "No such file"
		exit 1
else	
	name=$(date +%N)
	path="$trash/$name"
	ln "$input" "$path"
	rm "$input"
	way=$(pwd)
	time=$(date)
	echo "$way/$input" "Date of deleting " "$time"  "---" "$name" >> ~/trash.log
fi


