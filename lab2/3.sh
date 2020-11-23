#!/bin/bash
ps a -o stime,pid,cmd | tail -7 | head -1 | awk '{print $0}' 
