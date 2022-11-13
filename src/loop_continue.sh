#!/bin/bash
i=0
sum=0
while read LINE;do
    ((++i))
    [[ i -le 2 ]] && continue
    echo $LINE
    sum=$((sum + LINE))
done <<EOF
HEADER
======
1
2
3
EOF

echo "SUM=$sum"
