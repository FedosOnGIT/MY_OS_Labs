#!/bin/bash
array=()
size=$1
while true
do
	array+=(1 2 3 4 5 6 7 8 9 10)
	if [[ ${#array[*]} -ge "$size" ]] 
	then
		break
	fi
done
echo "Done ${#array[*]}, number $2"
exit 0
