#!/bin/bash
TMP_FILE=$(mktemp $0-XXX.txt) && {
    cat > $TMP_FILE <<EOF
Cherry
Durian
EOF
    sed -e '1s/^/Apple\nBanana\n/' $TMP_FILE
    rm -f $TMP_FILE
}
