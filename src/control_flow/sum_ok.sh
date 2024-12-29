i=0
sum=0
while read -r LINE;do
    [[ i -gt 2 ]] && break
    sum=$((sum + LINE))
    ((++i))
done <<EOF
1
2
3
4
5
EOF

echo "SUM=$sum"
