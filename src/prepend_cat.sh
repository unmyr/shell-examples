#!/bin/bash
TMP_FILE=$(mktemp $0-XXX.txt) && {
    cat > $TMP_FILE <<EOF
Banana
Cherry
EOF
    echo "Apple" | cat - $TMP_FILE
}
