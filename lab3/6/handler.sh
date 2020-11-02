#!/bin/bash
echo $$ > .pid
result=1
MODE="+"
usr1()
{
	MODE="+"
}
usr2()
{
	MODE="*"
}
term()
{
	MODE="stop"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM
while true;
do
	case "$MODE" in
	"+"	)
		let result=$result+2
		echo $result;;
	"*"	)
		let result=$result*2
		echo $result;;
	"stop"	)
		echo "End of work"
		exit 0;;
	esac
	sleep 1
done
