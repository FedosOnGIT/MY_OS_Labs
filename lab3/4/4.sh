#!/bin/bash
# Спросить про pidof
./fonProcess.sh &
first=$!
./fonProcess.sh &
./fonProcess.sh &
second=$!
kill "$second"
cpulimit -p "$first" -l 10
