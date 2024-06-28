#!/bin/bash
PID_FILE=$(mktemp -t $(basename "$0" .sh)XXX)
trap "rm -f ${PID_FILE}" 0

wait_all() {
    pids_running=("$@")
    while [ ${#pids_running[@]} -ne 0 ]; do
        pids_stopped=()
        for cur_pid in "${pids_running[@]}"; do
            kill -0 $cur_pid 2> /dev/null && continue
            pids_stopped+=($cur_pid)
        done

        for cur_pid in "${pids_stopped[@]}"; do
            pids_running=(${pids_running[@]/$cur_pid})
        done

        sleep 1
    done
}

echo "PID: $$"

cat <<EOF |
2
4
3
EOF

while read SLEEP_SEC; do
    MY_PID="$BASHPID"
    (
        echo "START($SLEEP_SEC): $MY_PID > $BASHPID"
        sleep $SLEEP_SEC
        echo "END($SLEEP_SEC): $MY_PID > $BASHPID"
    ) &
    echo $! >> $PID_FILE
done

mapfile -t pids_running < $PID_FILE

echo "+ time wait_all \"${pids_running[@]}\""
time wait_all "${pids_running[@]}"
echo "END"
