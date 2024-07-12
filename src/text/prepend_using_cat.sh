#!/bin/bash
TMP_FILE=$(mktemp $0-XXX.txt) || exit $?
trap "rm -f $TMP_FILE" 0

cat > $TMP_FILE <<EOF
Cherry
Durian
EOF

printf "Apple\nBanana\n" | cat - $TMP_FILE
