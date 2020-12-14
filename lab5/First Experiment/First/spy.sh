#!/bin/bash
top -n 1 -b | grep "КиБ Mem" >> parametrs/1.memory/0.1.mem.txt
top -n 1 -b | grep "КиБ Swap" >> parametrs/2.swap/0.2.swap.txt
top -n 1 -b | grep "mem.sh" >> parametrs/3.process/0.3.process.txt
date >> parametrs/4.top/0.4.top.txt
echo "First five processes are :" >> parametrs/4.top/0.4.top.txt
top -n 1 -b | awk 'NR > 7 && NR < 13 {print $0}' >> parametrs/4.top/0.4.top.txt

