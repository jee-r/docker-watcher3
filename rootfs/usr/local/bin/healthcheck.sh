#!/bin/sh

WATCHER3_PORT="$1"

if [ "$(netstat -plnt | grep -c $WATCHER3_PORT)" -eq 1 ]; then
   echo "Watcher3 [$WATCHER3_PORT] : OK"
else
  echo "Watcher3 [$WATCHER3_PORT] : NOK"
  exit 1
fi
