#!/usr/bin/env bash
while IFS= read -r -n1 CHR; do
        printf "${CHR} "
done <<< "Hello world"
echo
