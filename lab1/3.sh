#!/bin/bash
echo "Привет, юзер!
Хочешь запустить nano, нажми 1
Хочешь запустить vi, нажми 2
Хочешь запустить links, нажми 3
Хочешь выйти, нажми 4"
read input 

case "$input" in
1)
	exec nano;;
2)
	exec vi;;
3)
	exec links;;
4)
	echo "Конец!";;
*)
	exit 1;;
esac
