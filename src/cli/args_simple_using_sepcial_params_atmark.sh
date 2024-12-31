#!/usr/bin/env bash
# See: https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html
usage() {
    cat <<EOF
Usage: $0 "aaa" "hello world" "ccc"
EOF
}

if [ $# -ne 3 ]; then
    usage
    exit 1
fi

echo "COMMAND=$0, BASH_SOURCE=${BASH_SOURCE[0]}, ARGC=$#"

echo "+ for ARG in \"\$@\"; do ...; done"
i=0
for ARG in "$@"; do
    echo "ARGV[$i]='$ARG'"
    ((++i))
done
