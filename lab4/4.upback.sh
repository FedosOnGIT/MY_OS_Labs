#!/bin/bash
cd ~
if ! [[ -d restore ]]
then
	mkdir restore
fi
path=$(cat ~/backup-time | awk '{ print $1 }')
echo $path
cd ~/Backup-$path
ls
for current in $(ls -1)
do
	template=$(echo $current | grep -E -o '^[A-Za-z0-9]+-[0-9]+-[0-9]+-[0-9]+')
	if [[ $current != $template ]]
	then
		cp -R $current ~/restore
	fi
done
