#!/bin/bash
echo "\$@='$@'"
GETOPT_TEMP=$(getopt -o n:v --long dry-run,namespace: -- "$@")
VALID_ARGUMENTS=$?
echo VALID_ARGUMENTS=$VALID_ARGUMENTS
eval set -- "${GETOPT_TEMP}"
unset GETOPT_TEMP

usage() {
    cat 1>&2 <<EOF
Usage: $0 [-n |--namespace] [--dry-run]
EOF
}

DRY_RUN="false"
NAMESPACE=
while [ $# -gt 0 ]; do
    case "$1" in
    -n|--namespace) NAMESPACE=$2; shift 2;;
    --dry-run) DRY_RUN="true"; shift;;
    --) shift; break;;
    *)
        echo "ERROR: Unexpected option: OPTION='$1'" 1>&2
        usage
        exit 1
        ;;
    esac
done

cat <<EOF
NAMESPACE="${NAMESPACE}"
DRY_RUN="${DRY_RUN}"
ARG1="$1"
ARG2="$2"
EOF
