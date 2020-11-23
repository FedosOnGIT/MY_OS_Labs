#!/bin/bash
user="fedos"
ps a -o user,pid | grep "$user" | awk '{print $2}' >> temporary
answer=0
while read input
do
	name=$(ps -fp "$input" -o cmd --no-header)
	if [[ "$name" != "" ]]
	then
		answer=$(echo "$answer" | awk '{print $1 + 1}')
		echo "$input" " : " "$name" >> temp
	fi
done < temporary
echo "$answer" && cat temp
rm temporary
rm temp
