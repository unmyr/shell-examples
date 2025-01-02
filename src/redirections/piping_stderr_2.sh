#!/usr/bin/env bash
# 0: stdin, 1: stdout, 2: stderr

#
# Functions
#
trace_fds () {
    MESSAGE=$1
    test $VERBOSE = false && return 0

    echo "TRACE: $MESSAGE: \
1($(test -e /proc/$$/fd/1 && realpath /proc/self/fd/1 || echo '-')) \
2($(test -e /proc/$$/fd/2 && realpath /proc/self/fd/2 || echo '-')) \
${TMP_FD}($(test -e /proc/$$/fd/${TMP_FD} && realpath /proc/self/fd/${TMP_FD} || echo '-')): \
fds=[$(ls -m /proc/self/fd)]"
    lsof -p $$ -a -d 0,1,2,3 2>/dev/null
    echo ""
}

get_messages () {
    echo "ERROR: Several minor errors occurred" 1>&2
    echo "INFO: No fatal error occurred"
    echo "ERROR: Fatal error occurred" 1>&2
    echo "INFO: The xyz service recovered automatically"
    trace_fds "2a" 1>&2
}

filter_stdout () {
    grep -i -e '\(fatal\)' | sed -e 's/\(fatal\)/#\1#/i'
    trace_fds "2d: filter_stdout" 1>&2
}

filter_stderr () {
    sed -e 's/^/  /' | grep -i -e '\(fatal\|trace\)' | sed -e 's/\(fatal\)/*\1*/i' 1>&2
    trace_fds "2b: filter_stderr" | sed -e 's/^/  /' 1>&2
}

#
# main
#
GETOPT_TEMP=$(getopt -o v --long "verbose:" -- "$@")
eval set -- "${GETOPT_TEMP}"
unset GETOPT_TEMP

TMP_FD=3
VERBOSE=false
while [ $# -gt 0 ]; do
    case "$1" in
    -v|--verbose) VERBOSE=true; shift;;
    --) shift; break;;
    *)
        echo "ERROR: Unexpected option: OPTION='$1'" 1>&2
        exit 1
        ;;
    esac
done

test $VERBOSE = true && echo "INFO: TTY=$(tty)" 1>&2

trace_fds "1"

# n>&1: Duplicate the file descriptor from 1(stdout) to _n_.
# 2>&1: Duplicate the file descriptor from 1(stdout) to 2(stderr).
#            Redirects the 2(stderr) of the command to file descriptor 1(stdout)
# 1>&3: Duplicate the file descriptor from 1(stdout) to 3.
# n>&-: Close file descriptor _n_
{
    get_messages 2>&1 1>&3 3>&- | filter_stderr 3>&-
    trace_fds "2c" 1>&2
} 3> >(filter_stdout)
trace_fds "3" 1>&2
