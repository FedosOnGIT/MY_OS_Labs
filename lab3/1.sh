#!/bin/bash
time=$(date)
mkdir ~/test 2> /dev/null && (echo "catalog was successfully created" >> ~/report; touch ~/test/"$time")
ping www.net_nikogo.ru 2> /dev/null || (date; echo "nobody is here") >> ~/report
