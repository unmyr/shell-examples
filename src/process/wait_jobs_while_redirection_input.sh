#!/usr/bin/env bash
echo "PID: $$"

# Loop using redirection input.
while read SLEEP_SEC; do
    MY_PID="$BASHPID"
    (
        echo "START($SLEEP_SEC): $MY_PID > $BASHPID"
        sleep $SLEEP_SEC
        echo "END($SLEEP_SEC): $MY_PID > $BASHPID"
    ) &
done < <(seq 2 4 | shuf)

set -x
time wait $(jobs -p)
echo "END"
