#!/bin/env bash
test -t 0 -a ! -p /dev/stdin && echo -n "Enter the some word: "

read -r LINE
echo "Output: $LINE"
