#!/bin/bash
echo "" > report.log
echo "" > parametrs/0.time.txt
echo "" > parametrs/1.memory/0.1.mem.txt
echo "" > parametrs/2.swap/0.2.swap.txt
echo "" > parametrs/3.process/0.3.process.txt
echo "" > parametrs/4.top/0.4.top.txt
array=()
plus=(1 2 3 4 5 6 7 8 9 10)
check=0
start=$(date +%s)
while true
do
	check=$(($check + 1))
	array+=(${plus[*]})
	if [[ "$check" -eq 100000 ]]
	then
		echo "Array size: ${#array[*]}" >> report.log
		check=0
		time=$(date +%s)
		difference=$(($time - $start))
		echo "$difference" >> parametrs/0.time.txt
		./spy.sh
	fi
done
