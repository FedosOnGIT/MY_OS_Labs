#!/bin/bash
input=""
answer=""

while [[ "$input" != 'q' ]] 
do
	answer=$answer" "$input
	read input
done
echo $answer
