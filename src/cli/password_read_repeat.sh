#!/usr/bin/env bash
NEW_PASSWORD=
while read -r -s -p "Password: " NEW_PASSWORD; do
    echo ""
    read -r -s -p "Re-type new password: " CONFIRM_PASSWORD;
    test "${NEW_PASSWORD}" = "${CONFIRM_PASSWORD}" && { echo; break; }
    echo ""
    echo "ERROR: password verification error"
done
