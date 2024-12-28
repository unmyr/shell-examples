#!/usr/bin/env bash
mapfile -t a <<'EOF'
1
2
3
EOF

echo "size: ${#a[@]}"
for v in "${a[@]}"; do
    echo "$v"
done
