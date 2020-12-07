#!/bin/bash
./background.sh &
first=$!
./background.sh &
second=$!
./background.sh &
third=$!
sleep 60
sudo kill "$third"
sudo cpulimit -b --pid="$first" --limit=10
# edit to end processes
sleep 120
sudo kill "$first"
sudo kill "$second"
