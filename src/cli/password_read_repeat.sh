#!/usr/bin/env bash
NEW_PASSWORD=
while read -s -p "Password: " NEW_PASSWORD; do
    echo ""
    read -s -p "Re-type new password: " CONFIRM_PASSWORD;
    test "${NEW_PASSWORD}" = "${CONFIRM_PASSWORD}" && { echo; break; }
    echo ""
    echo "ERROR: password verification error"
done
