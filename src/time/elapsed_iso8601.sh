#!/bin/bash
set -x
T0_ISO8601="2023-12-31 23:16:15"
T1_ISO8601="2024-01-01 00:15:17"
printf "(%s - %s)/60.0\n" $(date --date "${T1_ISO8601}" +%s) $(date --date "${T0_ISO8601}" +%s) | bc -l
echo

python3 -c "from datetime import datetime; print(datetime.fromisoformat('${T1_ISO8601}') - datetime.fromisoformat('${T0_ISO8601}'))"
