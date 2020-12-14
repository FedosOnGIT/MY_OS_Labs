#!/bin/bash
awk '{print $3}' 0.2.swap.txt >> 1.total.txt
awk '{print $5}' 0.2.swap.txt >> 2.free.txt
awk '{print $7}' 0.2.swap.txt >> 3.used.txt
awk '{print $9}' 0.2.swap.txt >> 4.availMem.txt
