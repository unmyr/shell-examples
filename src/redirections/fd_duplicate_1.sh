#!/usr/bin/env bash
# 0: stdin, 1: stdout, 2: stderr
TMP_FD=5

trace_fds () {
    MESSAGE=$1
    echo "TRACE: $MESSAGE: \
1($(test -e /proc/$$/fd/1 && realpath /proc/self/fd/1 || echo '-')) \
2($(test -e /proc/$$/fd/2 && realpath /proc/self/fd/2 || echo '-')) \
3($(test -e /proc/$$/fd/3 && realpath /proc/self/fd/3 || echo '-')) \
${TMP_FD}($(test -e /proc/$$/fd/${TMP_FD} && realpath /proc/self/fd/${TMP_FD} || echo '-')): \
fds=[$(ls -m /proc/self/fd)]"
}

#
# main
#
trace_fds "1"
exec 5>&1
trace_fds "2"
echo "some messages 1"
trace_fds "3"
echo "some messages 3" 1>&5
trace_fds "4"
exec 5>&-
trace_fds "5"
