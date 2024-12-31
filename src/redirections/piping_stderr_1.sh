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

filter_info () {
    grep -i -e '\(fatal\)' | sed -e 's/\(fatal\)/#\1#/i'
    trace_fds "2d: filter_info" | sed -e 's/^/  /' 1>&2
}

filter_error () {
    sed -e 's/^/  /' | grep -i -e '\(fatal\|trace\)' | sed -e 's/\(fatal\)/*\1*/i' 1>&2
    exec 3>&-
    trace_fds "2b: filter_error" | sed -e 's/^/  /' 1>&2
}

echo "INFO: TTY=$(tty)"

trace_fds "1"

# n>&1: Duplicate the file descriptor from 1(stdout) to _n_.
# 2>&1: Duplicate the file descriptor from 1(stdout) to 2(stderr).
#            Redirects the 2(stderr) of the command to file descriptor 1(stdout)
# 1>&3: Duplicate the file descriptor from _n_ to 1(stdout).
# n>&-: Close file descriptor _n_
{
    get_messages 2>&1 1>&3 3>&- | filter_error
    trace_fds "2c" 1>&2
} 3> >(filter_info)
# {
#     get_messages 2>&1 1>&3 3>&- | filter_error 3>&-
#     exec 3>&-
#     trace_fds "2c" 1>&2
# } 3>&1
trace_fds "3" 1>&2
