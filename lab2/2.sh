#!/bin/bash
ps a -e -o pid,cmd | grep -E "[[:digit:]]+[[:space:]]\/sbin\/"
