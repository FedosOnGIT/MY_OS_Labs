#!/bin/bash
/home/fedos/OS\ Labs/lab2/4.sh >> temp
ppid=1
time=0
number=0
while read string
do
	new=$(echo "$string" | awk '{print $7}')
	plus=$(echo "$string" | awk '{print $11}')
	if [[ "$ppid" -eq "$new" ]]
	then
		time=$(echo "$time" "$plus" | awk '{print $1 + $2}')
		number=$(echo "$number" | awk '{print $1 + 1}')
	else 
		average=$(echo "$time" "$number" | awk '{print $1 / $2}')
		echo "Average_Sleeping_Children_of_ParentId =" "$ppid" "is" "$average"
		ppid="$new"
		time="$plus"
		number=1
	fi
	echo "$string"
done < temp
average=$(echo "$time" "$number" | awk '{print $1 / $2}')
echo "Average_Sleeping_Children_of_ParentId =" "$ppid" "is" "$average"
rm temp
