#!/usr/bin/env bash
SCRIPT_PATH_IN=${BASH_SOURCE:-$0}
SCRIPT_NAME=$(basename ${SCRIPT_PATH_IN} .sh)
SCRIPT_DIR=$(dirname ${SCRIPT_PATH_IN})

cat > ${SCRIPT_DIR}/logrotate.${SCRIPT_NAME}.conf <<EOF
$(realpath ${SCRIPT_DIR})/stdout.log {
    missingok
    rotate 1
    size 2M
}

$(realpath ${SCRIPT_DIR})/stderr.log {
    missingok
    rotate 1
    size 2M
}
EOF

# /usr/sbin/logrotate --verbose --state ${SCRIPT_DIR}/logrotate.${SCRIPT_NAME}.state ${SCRIPT_DIR}/logrotate.${SCRIPT_NAME}.conf
/usr/sbin/logrotate --state ${SCRIPT_DIR}/logrotate.${SCRIPT_NAME}.state ${SCRIPT_DIR}/logrotate.${SCRIPT_NAME}.conf

exec 1> >(while IFS= read -r LINE; do printf "[$(date --iso-8601=sec)] $LINE\n"; done >> stdout.log)
exec 2> >(while IFS= read -r LINE; do printf "[$(date --iso-8601=sec)] $LINE\n"; done >> stderr.log)

echo "error1 error2" | tr ' ' '\n' 1>&2
echo "info1 info2" | tr ' ' '\n'
