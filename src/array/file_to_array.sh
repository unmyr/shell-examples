#!/usr/bin/env bash
TMP_FILE=$(mktemp -t $(basename "$0" .sh)XXX)
trap "rm -f ${TMP_FILE}" 0

cat > $TMP_FILE <<EOF
1
2
3
EOF

mapfile -t a < $TMP_FILE
echo "size: ${#a[@]}"
for v in "${a[@]}"; do
    echo "$v"
done
