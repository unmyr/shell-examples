#!/bin/sh
TMP_FILE=$(mktemp -t aaaXXX)
trap "rm -f ${TMP_FILE}" 0

ls -l ${TMP_FILE}
