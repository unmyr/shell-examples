#!/usr/bin/env bash
i=1
while read -r LINE;do
    [[ i -gt 3 ]] && break
    echo i=$i: $LINE
    ((++i))
done <<EOF
A
B
C
D
E
F
G
EOF

echo "END"
