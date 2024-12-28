#!/usr/bin/env bash
if [ -t 0 ]; then
  echo "Pipe not open"
else
  echo "Pipe available"
  cat - | sed -e 's/^/> /'
fi
