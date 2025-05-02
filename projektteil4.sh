#!/bin/bash

for file in /var/www/html/*; do
  if [[ $(basename "$file") =~ \.html$ ]]; then
    echo "Gefundene HTML-Datei: $(basename "$file")"
  fi
done