#!/bin/sh

if  [ ! -d /app/watcher3 ]; then
  git clone https://github.com/barbequesauce/Watcher3.git /app/watcher3 
else
  git -C /app/watcher3 pull
fi

python3 /app/watcher3/watcher.py -c /config/watcher.conf -l /config/logs --db /config/database.sqlite --plugins /config/plugins --posters /config/posters
