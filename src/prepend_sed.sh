#!/bin/bash
TMP_FILE=$(mktemp $0-XXX.txt) && {
    cat > $TMP_FILE <<EOF
Banana
Cherry
EOF
    sed -e '1s/^/Apple\n/' $TMP_FILE
}
