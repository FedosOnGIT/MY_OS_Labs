#!/bin/bash
top -n 1 -b | grep "КиБ Mem" >> parametrs/second/1.memory/0.1.mem.txt
top -n 1 -b | grep "КиБ Swap" >> parametrs/second/2.swap/0.2.swap.txt
top -n 1 -b | grep "mem2.sh" >> parametrs/second/3.process/0.3.process.txt
date >> parametrs/second/4.top/0.4.top.txt
echo "First five processes are :" >> parametrs/second/4.top/0.4.top.txt
top -n 1 -b | awk 'NR > 7 && NR < 13 {print $0}' >> parametrs/second/4.top/0.4.top.txt

