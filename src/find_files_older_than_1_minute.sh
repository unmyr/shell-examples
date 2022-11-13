#!/bin/sh
touch a.txt
ls -l --time-style=+'%Y/%m/%d %H:%M:%S' a.txt
trap "rm -f a.txt" 0

t0=$(date +%s)

date '+%Y-%m-%d %H:%M:%S'
while [ $(($(date +%s) -${t0})) -lt 90 ]; do
    COUNT=$(find . -name a.txt -mmin +1 -type f | wc -l)
    test $COUNT -gt 0 && break
    # echo "time: " $(($(date +%s) -${t0}))
    sleep 0.5
done
t1=$(date +%s)
echo "time: " $(($(date +%s) -${t0}))
date '+%Y-%m-%d %H:%M:%S'
ls -l --time-style=+'%Y/%m/%d %H:%M:%S' a.txt
