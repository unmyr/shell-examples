#!/usr/bin/env bash
echo "--- Read lines from stdin ---"
bash <(cat <<'EOF'
#!/usr/bin/env bash
echo "[$(date --iso-8601=sec) ]: INFO: ARGC=$#, ARGS=[$@]"
echo "[$(date --iso-8601=sec) ]: INFO:" $(test -t 0; if [ $? -eq 0 ]; then echo 'stdin is coming from the terminal'; else echo 'stdin is not coming from the terminal'; fi)
echo "[$(date --iso-8601=sec) ]: INFO:" $(test -p /dev/stdin; if [ $? -eq 0 ]; then echo 'stdin is coming from a pipe'; else echo 'stdin is not coming from a pipe'; fi)
echo "[$(date --iso-8601=sec) ]: INFO: /dev/stdin -> $(realpath /dev/stdin)"

pstree -a -p $PPID

while read -r LINE; do
    echo "[$(date --iso-8601=sec) ]: /dev/stdin: $LINE"
done
EOF
) < <(echo "1"; sleep 1; echo "2"; sleep 1; echo "3"; sleep 3)

echo ""

echo "--- Read lines from argv[1] ---"
bash <(cat <<'EOF'
#!/usr/bin/env bash
IN_FILE1=$1
IN_FILE2=$2
echo "[$(date --iso-8601=sec) ]: INFO: ARGC=$#, ARGS=[$@]"
echo "[$(date --iso-8601=sec) ]: INFO:" $(test -t 0; if [ $? -eq 0 ]; then echo 'stdin is coming from the terminal'; else echo 'stdin is not coming from the terminal'; fi)
echo "[$(date --iso-8601=sec) ]: INFO:" $(test -p /dev/stdin; if [ $? -eq 0 ]; then echo 'stdin is coming from a pipe'; else echo 'stdin is not coming from a pipe'; fi)
echo "[$(date --iso-8601=sec) ]: INFO:/dev/stdin -> $(realpath /dev/stdin)"
echo "[$(date --iso-8601=sec) ]: ${IN_FILE1} -> $(realpath ${IN_FILE1})"
echo "[$(date --iso-8601=sec) ]: ${IN_FILE2} -> $(realpath ${IN_FILE2})"

pstree -a -p $PPID

while read -r LINE; do
    echo "[$(date --iso-8601=sec) ]: \$1=$1: $LINE"
done < <(cat $IN_FILE1) &

while read -r LINE; do
    echo "[$(date --iso-8601=sec) ]: \$2=$2: $LINE"
done < <(cat $IN_FILE2) &

wait
EOF
) <(echo "a"; sleep 1; echo "b"; sleep 1; echo "c"; sleep 1) <(sleep 1; echo "A"; sleep 1; echo "B"; sleep 1; echo "C") </dev/null
