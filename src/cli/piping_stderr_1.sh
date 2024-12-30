#!/usr/bin/env bash
# 0: stdin, 1: stdout, 2: stderr
TMP_FD=3

trace_fds () {
    MESSAGE=$1
    echo "TRACE: $MESSAGE: \
1($(test -e /proc/$$/fd/1 && realpath /proc/self/fd/1 || echo '-')) \
2($(test -e /proc/$$/fd/2 && realpath /proc/self/fd/2 || echo '-')) \
${TMP_FD}($(test -e /proc/$$/fd/${TMP_FD} && realpath /proc/self/fd/${TMP_FD} || echo '-')): \
fds=[$(ls -m /proc/self/fd)]"
}

get_messages () {
    echo "ERROR: Several minor errors occurred" 1>&2
    echo "INFO: No fatal error occurred"
    echo "ERROR: Fatal error" 1>&2
    echo "INFO: The xyz service recovered automatically"
    trace_fds "2a" 1>&2
}

filter_error () {
    sed -e 's/^/  /' | grep -i -e '\(fatal\|trace\)' | sed -e 's/\(fatal\)/*\1*/i' 1>&2
    trace_fds "2b" | sed -e 's/^/  /' 1>&2
}

echo "INFO: TTY=$(tty)"

trace_fds "1"

# 2>&1: Redirects the stderr of the command to file descriptor 1
#   >&3: Create file descriptor 3, and redirects the stdout of the command to file descriptor 3
# 3>&-: Close file descriptor 3
# 3>&1: Redirects the output of the command to file descriptor 1
# {
#     get_messages 2>&1 1>&3 3>&-| filter_error
#     trace_fds "2c" 1>&2
# } 3> >(trace_fds "2d"; grep -e '\(recovered\)')
{
    get_messages 2>&1 >&3 3>&-  | filter_error 3>&-
    trace_fds "2c" 1>&2
} 3>&1
trace_fds "3" 1>&2
