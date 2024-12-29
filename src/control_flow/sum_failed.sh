#!/usr/bin/env bash
trap 'rm -f a.txt' 0

cat > a.txt <<EOF
HEADER
======
1
2
3
EOF

i=0
sum=0
cat a.txt | while read -r LINE;do
    ((++i))
    [[ i -le 2 ]] && continue
    echo $LINE
    sum=$((sum + $LINE))
done

echo "SUM=$sum"
