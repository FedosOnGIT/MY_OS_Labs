#!/bin/bash
Example() {
	echo "2+2=?"
	read answer
	if [[ "$answer" -eq 4 ]]
	then
		echo "Ты молодец!"
	else
		echo "Дибил"
		echo
		Example
	fi
}
echo "Реши"
Example
