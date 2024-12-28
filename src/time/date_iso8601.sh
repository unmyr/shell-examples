#!/usr/bin/env bash
DATE="2006-08-14T02:34:56-06:00"
set -x
date -d "${DATE}" --iso-8601
date -d "${DATE}" --iso-8601=date
date -d "${DATE}" --iso-8601=hours
date -d "${DATE}" --iso-8601=minutes
date -d "${DATE}" --iso-8601=seconds
