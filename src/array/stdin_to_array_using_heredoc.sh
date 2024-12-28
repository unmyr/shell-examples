#!/usr/bin/env bash
mapfile -t a <<'EOF'
foo
bar
Hello world
EOF

echo "size: ${#a[@]}"
for v in "${a[@]}"; do
    echo "$v"
done
