#!/bin/sh

if ! [ -d /app/watcher3 ]; then
  cd /app
  git clone https://github.com/barbequesauce/Watcher3.git /app/watcher3
fi

python3 /app/watcher3/watcher.py -c /config/watcher.conf -l /config/logs --db /config/database.sqlite --plugins /config/plugins --posters /config/posters
