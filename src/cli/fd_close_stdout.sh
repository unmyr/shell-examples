#!/usr/bin/env bash
# 0: stdin, 1: stdout, 2: stderr
TMP_FD=5

trace_fds () {
    MESSAGE=$1
    echo "TRACE: $MESSAGE: \
1($(test -e /proc/$$/fd/1 && realpath /proc/self/fd/1 || echo '-')) \
2($(test -e /proc/$$/fd/2 && realpath /proc/self/fd/2 || echo '-')) \
${TMP_FD}($(test -e /proc/$$/fd/${TMP_FD} && realpath /proc/self/fd/${TMP_FD} || echo '-')): \
fds=[$(ls -m /proc/self/fd)]"
}

#
# main
#
trace_fds "1(opened) 5(closed)"

exec 5>&1 1>&-
trace_fds "1(closed) 5(opened)" 1>&5
echo "some messages 5: 1(closed) 5(opened)" 1>&5

exec 1>&5 5>&-
trace_fds "1(opened) 5(closed)"
echo "some messages 1: 1(opened) 5(closed)"
