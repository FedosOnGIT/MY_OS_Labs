#!/bin/bash
# Зачем \;
sudo -i find "/var/log" -name '*.log' -exec cat "{}" \; | wc -l
