#!/bin/bash
awk '{print $4}' 0.1.mem.txt >> 1.total.txt
awk '{print $6}' 0.1.mem.txt >> 2.free.txt
awk '{print $8}' 0.1.mem.txt >> 3.used.txt
awk '{print $10}' 0.1.mem.txt >> 4.buff.cache.txt
