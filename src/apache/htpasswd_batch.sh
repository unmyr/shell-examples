#!/bin/bash
test $# -ne 1 && { echo "ERROR: Invalid argument. : ARG-NUM=$#"; exit 1; }
HTPASSWD_FILE=".htpasswd"

case $1 in
create)
    touch ${HTPASSWD_FILE}

    while read HTUSER; do
        (set -x; pwgen 12 1 | tee .pass.${HTUSER} | htpasswd -i ${HTPASSWD_FILE} ${HTUSER})
    done <<EOF
user01
user02
EOF
    wc -l ${HTPASSWD_FILE}
    ;;

delete)
    while read HTUSER; do
        (set -x; htpasswd -D ${HTPASSWD_FILE} ${HTUSER})
    done <<EOF
user01
user02
EOF
    ls -l ${HTPASSWD_FILE}
    rm -f ${HTPASSWD_FILE}
    ;;
esac