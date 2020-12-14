#!/bin/bash
awk '{print $5}' 0.3.process.txt >> 1.virt.txt
awk '{print $6}' 0.3.process.txt >> 2.res.txt
awk '{print $10}' 0.3.process.txt >> 3.percent.txt
