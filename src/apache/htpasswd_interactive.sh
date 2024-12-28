#!/usr/bin/env bash
test $# -eq 2 || { echo "ERROR: Invalid argument. : ARG-NUM=$#"; exit 1; }
SUB_COMMAND=$1
HTUSER=$2
HTPASSWD_FILE=".htpasswd"

case "${SUB_COMMAND}" in
add)
    test -s ${HTPASSWD_FILE} || touch ${HTPASSWD_FILE}
    wc -l ${HTPASSWD_FILE}
    while true; do
        grep -qE "^${HTUSER}:" ${HTPASSWD_FILE} && { echo "WARNING: User already exists : USER='${HTUSER}'"; break;}
        (set -x; htpasswd ${HTPASSWD_FILE} ${HTUSER}) && break
    done
    wc -l ${HTPASSWD_FILE}
    ;;

delete)
    (set -x; htpasswd -D ${HTPASSWD_FILE} ${HTUSER})
    ;;
esac
