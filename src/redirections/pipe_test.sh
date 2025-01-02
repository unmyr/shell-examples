#!/usr/bin/env bash
test -e /proc/self/fd/0 && echo "INFO: FD 0(stdin) is opened" || { echo "ERROR: FD 0(stdin) is closed"; exit 1; }

IS_TTY=$(test -t 0 && echo "yes" || echo "no")
IS_PIPE=$(test -p /proc/self/fd/0 && echo "yes" || echo "no")

if [ $IS_TTY = "yes" ]; then
    echo "INFO: File descriptor FD is opened on a terminal : FD=0 PATH='$(realpath /proc/self/fd/0)'"
elif [ $IS_PIPE = "yes" ]; then
    echo "INFO: File descriptor FD is open on a pipe : FD=0 PATH='$(realpath /proc/self/fd/0)'"
    (set -x; cat -)
else
    echo "INFO: File descriptor is open on something other than a terminal or a pipe. : FD=0 PATH=$(realpath /proc/self/fd/0)"
    (set -x; cat -)
fi

set -x
lsof -p $$ -a -d 0 2>/dev/null
