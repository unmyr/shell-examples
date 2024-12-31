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
trace_fds "T1: 1(opened) 5(closed)"
exec 5>&1 1>&- 1>&2 2>&5 5>&-
trace_fds "T2: 1->stderr, 2->stdout"
python3 -c "import sys; print('some stdout', file=sys.stdout)"
python3 -c "import sys; print('some stderr', file=sys.stderr)" | sed -e 's/^/I:/'
