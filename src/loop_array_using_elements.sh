#!/bin/bash
a=(foo bar "Hello world")
for v in "${a[@]}"; do
    echo "$v"
done
