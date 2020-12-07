#!/bin/bash
(sleep 120; ./1.sh)&
(tail -f ~/report)
