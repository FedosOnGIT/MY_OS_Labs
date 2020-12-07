#!/bin/bash
echo "" > report1.log
echo "" > spy1.txt
array=()
plus=(1 2 3 4 5 6 7 8 9 10)
check=0
while true
do
	check=$(($check + 1))
	array+=(${plus[*]})
	if [[ "$check" -eq 400000 ]]
	then
		echo "Array size: ${#array[*]}" >> report1.log
		check=0
		time=$(date)
		(echo "Date is $time") >> spy1.txt
		./spy1.sh >> spy1.txt
	fi
done