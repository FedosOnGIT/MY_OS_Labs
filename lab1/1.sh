#!/bin/bash

read first second third

if [[ "$first" -ge "$second" ]]
	then maximal="$first"
	else maximal="$second"
fi

if [[ "$third" -gt "$maximal" ]]
	then maximal="$third"
fi

echo "$maximal"
