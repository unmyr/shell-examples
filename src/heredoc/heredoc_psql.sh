#!/bin/bash
sudo -u postgres psql --echo-queries <<'EOF'
\conninfo
SELECT 1;
EOF
