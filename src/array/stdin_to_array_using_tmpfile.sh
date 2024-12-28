#!/usr/bin/env bash
TMP_FILE=$(mktemp -t $(basename "$0" .sh)XXX.tmp)
trap "set -x; rm -f ${TMP_FILE}" 0

cat > $TMP_FILE <<EOF
foo
bar
Hello world
EOF

mapfile -t a < $TMP_FILE
echo "size: ${#a[@]}"
for v in "${a[@]}"; do
    echo "$v"
done
