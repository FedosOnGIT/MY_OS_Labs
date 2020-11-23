#!/bin/bash
for pid in $(ps a -o pid --no-header)
do
	parent=/proc/$pid/status
	time=/proc/$pid/sched
	if [[ (-f "$parent") && (-f "$time") ]]
	then
		ppid=$(grep PPid "$parent" | awk '{print $2}')
		sum_time=$(grep sum_exec_runtime "$time" | awk '{print $3}')
		number=$(grep nr_switches "$time" | awk '{print $3}')
		art=$(echo "$sum_time" "$number" | awk '{print $1 / $2}')
		echo "ProcessId =" "$pid" ": Parent_ProcessId =" "$ppid" ": Average_Running_Time =" "$art" >> temporary
	fi
done
cat temporary | sort -n -k 7
rm temporary
