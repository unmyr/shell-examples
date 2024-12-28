#!/usr/bin/env bash
sed -e '/^extraEnvVars: \[\]$/r'<(cat <<'EOF'
- extraEnvVars:
  - name: FOO
    value: foo
  - name: BAR
    value: bar
EOF
) -e '//d' <<'EOF'
## BEGIN
extraEnvVars: []
## END
EOF
