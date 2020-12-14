#!/bin/bash
echo "" > report1.log
echo "" > parametrs/first/0.time.txt
echo "" > parametrs/first/1.memory/0.1.mem.txt
echo "" > parametrs/first/2.swap/0.2.swap.txt
echo "" > parametrs/first/3.process/0.3.process.txt
echo "" > parametrs/first/4.top/0.4.top.txt
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
		echo "Array size: ${#array[*]}" >> report1.log
		check=0
		time=$(date +%s)
		difference=$(($time - $start))
		echo "$difference" >> parametrs/first/0.time.txt
		./spy1.sh
	fi
done
