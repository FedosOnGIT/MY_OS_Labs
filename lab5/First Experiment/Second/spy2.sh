#!/bin/bash
echo "First two lines are:"
top -n 1 -b | grep "КиБ Mem"
top -n 1 -b | grep "КиБ Swap"
parametrs=$(top -n 1 -b | grep "mem2.sh")
echo "mem.sh parametrs are : $parametrs"
echo "First five processes are :"
top -n 1 -b | awk 'NR > 7 && NR < 13 {print $0}'
echo 
