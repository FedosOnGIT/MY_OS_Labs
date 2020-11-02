#!/bin/bash
from=/var/log/syslog
to=/home/fedos/OS\ Labs/lab1/full.log
grep "(WW)" "$from" | sed 's/(WW)/Warning:/g' > "$to"
grep "(II)" "$from" | sed 's/(II)/Information/g' >> "$to"

