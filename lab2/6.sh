#!/bin/bash
answer=""
maximal=0
for pid in $(ps a -e -o pid)
do
	from=/proc/$pid/status
	if [[ -f "$from" ]]
	then 
		memory=$(grep -i VMSIZE "$from" | awk '{ print $2 }')
		if [[ $memory -gt $maximal ]]
		then
			maximal=$memory
			answer=$pid
		fi
	fi
	if [[ "$pid" == "2366" ]]
	then
		echo "yes" "$memory"
	fi
done
echo "PID is" "$answer" "," "used memory =" "$maximal" "kB."
