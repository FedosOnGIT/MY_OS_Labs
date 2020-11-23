#!/bin/bash
if [[ $# -ne 1 ]]
then
	echo "Wrong number of arguments"
	exit 1
fi
input=$1
trash=$(cat ~/trash.log)
find=true
echo "" > ~/trash.log
IFS=$'\n'
for string in $trash
do
	if $find;
	then
		if [[ $(echo "$string" | grep "$input") ]]
		then
			# find string about this file
			name=$(echo "$string" | awk -F " --- " '{print $1}')
			number=$(echo "$string" | awk -F " --- " '{print $2}')
			way=~/trash/$number
			echo "Do you want to restore $name? Yes/No"
			read answer
			if [[ $answer == "Yes" ]]
			then
				cd ~/trash
				if [[ -f "$way" ]]
				then
					directory=$(echo "$name" | grep -o ".*/")
					if ! [[ -d "$directory" ]]
					then
						ln "$way" ~/"$input"
						rm "$way"
					else
						cd "$directory"
						if ! [[ -f "$input" ]]
						then
							ln "$way" "$input"
							rm "$way"
						else 
							echo "$input" " This file is already exists."
							echo "Do you want to change name? Yes/No"
							read answer
							if [[ "$answer" == "Yes" ]]
							then
								read new
								ln "$way" "$new"
								rm "$way"
							fi
						fi
						cd ~
					fi
				else
					echo "This file has been already restored!"
				fi
				find=false
			else
				echo "$string" >> ~/trash.log
			fi
		else
			echo "$string" >> ~/trash.log
		fi
	else
		echo "$string" >> ~/trash.log
	fi						
done
