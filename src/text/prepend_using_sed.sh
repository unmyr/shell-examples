#!/usr/bin/env bash
TMP_FILE=$(mktemp $0-XXX.txt) || exit $?
trap "rm -f $TMP_FILE" 0

cat > $TMP_FILE <<EOF
Cherry
Durian
EOF

# REP="Apple\nBanana\n"
REP=$(cat <<EOF | sed 's/$/\\n/g' | tr -d '\n'
Apple
Banana
EOF
)

sed -e "1s/^/${REP}/" $TMP_FILE
