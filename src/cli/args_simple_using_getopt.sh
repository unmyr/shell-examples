#!/usr/bin/env bash
echo "COMMAND=$0, BASH_SOURCE=${BASH_SOURCE[0]}, ARGC=$#"

usage () {
    cat 1>&2 <<EOF
Usage: $0 [OPTION]...  "aaa" "hello world" "ccc"
EOF
}

GETOPT_TEMP=$(getopt -o "" --long "" -- "$@")
VALID_ARGUMENTS=$?
echo VALID_ARGUMENTS=$VALID_ARGUMENTS
eval set -- "${GETOPT_TEMP}"
unset GETOPT_TEMP

while getopts "" opt; do
    echo "OPTARG: $OPTARG"
    case $opt in
        \?) usage; exit 1;;
    esac
done
shift "$(($OPTIND-1))"


echo '+ for ARG in "\$@"; do ...; done -- getopt'
i=0
for ARG in "$@"; do
    echo "ARGV[$i]='$ARG'"
    ((++i))
done
