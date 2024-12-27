#!/usr/bin/env bash
SCRIPT_PATH_IN=${BASH_SOURCE:-$0}
SCRIPT_NAME=$(basename ${SCRIPT_PATH_IN} .sh)
SCRIPT_DIR=$(dirname ${SCRIPT_PATH_IN})

SHOW_ARGS_SHELL="${SCRIPT_DIR}/${SCRIPT_NAME}_show_args.sh"

bash <(cat <<'EOF'
#!/usr/bin/env bash
SCRIPT_PATH_IN=${BASH_SOURCE:-$0}

echo "COMMAND: $0, BASH_SOURCE: ${BASH_SOURCE}; ARGC: $#, ARGS: $@"

for STDIN in "$@"; do
    (set -x; cat $STDIN)
done
EOF
) <(echo "apple") <(echo "banana peach" | tr ' ' '\n')
