#!/bin/bash
a=(foo bar "Hello world")
for ((i = 0; i < ${#a[@]}; i++)); do
    echo "$i: ${a[$i]}"
done
