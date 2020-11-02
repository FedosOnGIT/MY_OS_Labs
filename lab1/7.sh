#!/bin/bash
grep -E -o -s -h "[[:alnum:]]+@[[:lower:]]+\.[[:lower:]]+" /etc/* | awk '{ printf("%s, ", $0) }' | awk '{ print $0 "!" }' > email.lst
sed -i 's/, !/./g' email.lst
