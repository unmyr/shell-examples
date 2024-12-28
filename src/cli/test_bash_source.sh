#!/usr/bin/env bash
printf "%-22s %-22s\n" '$0' '${BASH_SOURCE[0]}'
printf "%-22s %-22s\n" $(printf '=%.0s' {1..22}) $(printf '=%.0s' {1..22})
printf "%-22s %-22s\n" "$0" "${BASH_SOURCE[0]}"
