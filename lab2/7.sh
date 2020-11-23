#!/bin/bash
for pid in $(ps -A -o pid --no-header)
do
	from=/proc/$pid/io
	if [[ -f "$from" ]]
		then
		start=$(sudo grep read_bytes "$from" | awk '{ print $2 }')
		echo "$pid" " " $start >> temp
	fi
done
echo "Go to bed"
sleep 60
echo "Wake up"
while read input
do
	pid=$(echo "$input" | awk '{print $1}')
	start=$(echo "$input" | awk '{print $2}')
	from=/proc/$pid/io
	if [[ -f "$from" ]]
		then
		end=$(sudo grep read_bytes "$from" | awk '{ print $2 }')
		echo "$pid" " " $(echo "$end" "$start" | awk '{ print $1 - $2}') >> temporary
	fi
done < temp
cat temporary | sort -r -n -k 2 | head -3
rm temp
rm temporary 

