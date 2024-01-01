#!/bin/bash
TMP_FILE=$(mktemp $0-XXX.txt) && {
    cat > $TMP_FILE <<EOF
Cherry
Durian
EOF
    printf "Apple\nBanana\n" | cat - $TMP_FILE
    rm -f $TMP_FILE
}
