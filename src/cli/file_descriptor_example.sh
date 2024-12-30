#!/usr/bin/env bash
echo "INFO: Before the file descriptor is opened: $(ls -m /proc/self/fd)"

echo "INFO: Open file descriptor 5."
exec 5< <(echo "apple cherry banana" | tr ' ' '\n')
# exec 5<<EOF
# apple
# cherry
# banana
# EOF

echo "INFO: After the file descriptor 5 is open: $(ls -m /proc/self/fd)"
echo "INFO: realpath /proc/self/fd/5 -> $(realpath /proc/self/fd/5)"
echo "INFO: test -p /proc/self/fd/5 -> $(test -p /proc/self/fd/5; echo $?)"

# Read lines from file descriptor 3 in a loop
while read -r -u 5 LINE; do
    echo "Read from file descriptor 5: $LINE"
done

echo "INFO: Close file descriptor 5."
exec 5>&-
echo "INFO: After the file descriptor 5 is closed: $(ls -m /proc/self/fd)"
