#!/bin/bash
read input
echo $input >> temporary
while read pid
do
	echo $pid
	for child in $(ps a -e -o pid --no-header)
	do
		parent=/proc/$child/status
		if [[ -f $parent ]]
		then
			ppid=$(grep PPid $parent | awk '{print $2}')
			if [[ $ppid -eq $pid ]]
			then
				echo $child >> temporary
			fi
		fi
	done
done < temporary
rm temporary
