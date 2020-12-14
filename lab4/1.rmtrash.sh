#!/bin/bash
read input
if [[ -d "$input" ]]
then
	echo "It is a directory! Not a file!"
	exit 1
fi
if [[ "$input" == "/" || "$input" == "null" ]]
then
	echo "Unaccaptable name to file!"
	exit 1
fi
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


