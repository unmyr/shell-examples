#!/bin/bash
a=(foo bar "Hello world")
IFS_OLD="$IFS"
IFS=""
for v in ${a[@]}; do
    echo "$v"
done
IFS="$IFS_OLD"
