#!/bin/bash
X_OPT=0
F_ARG="nil"

usage() {
    MESSAGE="$1"
    test -n "$MESSAGE" && echo "$MESSAGE" 1>&2
    cat 1>&2 <<EOF
$0 [-h] [-f FOO] [-x] file1 file2
EOF
}

while getopts "f:hx" opt; do
  echo "OPTARG: $OPTARG"
  case $opt in
    f) F_ARG="$OPTARG" ;;
    h) usage; exit 0;;
    x) X_OPT=1;;
    \?) usage; exit 1;;
  esac
done
shift "$(($OPTIND-1))"
echo "TRACE: OPTIND=$OPTIND"

test $# -ne 2 && usage "ERROR: Invalid operand. : ARG-NUM=$#" && exit 1
echo "TRACE: ARG_NUM=$# X_OPT=$X_OPT F_ARG=$F_ARG ARG1=$1 ARG2=$2"

