#!/bin/bash
way=/home/fedos/OS\ Labs/lab1/help.txt
to=/home/fedos/OS\ Labs/lab1/info.log
awk '{ if ($2 == "INFO")
	print $0 }' "$way" > "$to"
