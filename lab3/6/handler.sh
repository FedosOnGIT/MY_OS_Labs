#!/bin/bash
echo $$ > .pid
result=1
Mode="nothing"
usr1()
{
	Mode="+"
}
usr2()
{
	Mode="*"
}
sigterm()
{
	Mode="stop"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true
do
	case "$Mode" in
	"+"	)
		result=$(echo "$result" | awk '{ print $1 + 2 }')
		echo "$result";;
	"*"	)
		result=$(echo "$result" | awk '{ print $1 * 2 }')
		echo "$result";;
	"stop"	)
		echo "End of the work"
		exit 0;;
	*	)
		:;;
	esac
	sleep 1
done  
