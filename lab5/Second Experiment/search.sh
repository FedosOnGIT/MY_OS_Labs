#!/bin/bash
touch search.log
left=0
right=8300000
while [[ $(($right - $left)) -ge 100000 ]]
do	
	mid=$((($right + $left) / 2))
	./run.sh 30 $mid
	sleep 200
	count=$(cat search.log | wc -l)
	if [[ $count -eq 30 ]]
	then
		left=$mid
	else
		right=$mid
	fi
done
echo "optimal size is $right" >> report.txt
