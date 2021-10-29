#!/bin/sh

if  [ ! -f /app/watcher.py ]; then
  git clone https://github.com/barbequesauce/Watcher3.git /app/
else
  git -C /app/ pull
fi


python3 /app/watcher.py -c /config/watcher.conf -l /config/logs --db /config/database.sqlite --plugins /config/plugins --posters /config/posters
