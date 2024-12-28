#!/usr/bin/env bash
read -s -p "Password: " MY_PASSWORD
echo

if [ -z "$MY_PASSWORD" ]; then
    echo "ERROR: You have not entered your password. Stop processing." 1>&2
    exit 1
fi
echo "PASS: $MY_PASSWORD"
