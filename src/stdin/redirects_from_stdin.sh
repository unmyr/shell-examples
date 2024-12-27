#!/usr/bin/env bash
SCRIPT_PATH_IN=${BASH_SOURCE:-$0}
SCRIPT_NAME=$(basename ${SCRIPT_PATH_IN} .sh)
SCRIPT_DIR=$(dirname ${SCRIPT_PATH_IN})

SHOW_ARGS_SHELL="${SCRIPT_DIR}/${SCRIPT_NAME}_show_args.sh"

trap "rm -f ${SHOW_ARGS_SHELL}" EXIT

cat > ${SHOW_ARGS_SHELL} <<'EOF'
#!/usr/bin/env bash
echo "ARGC: $#"
echo "ARGS: $@"

for STDIN in "$@"; do
    (set -x; cat $STDIN)
done
EOF
chmod a+x ${SHOW_ARGS_SHELL}

bash ${SHOW_ARGS_SHELL} <(echo "apple") <(echo "banana peach" | tr ' ' '\n')
