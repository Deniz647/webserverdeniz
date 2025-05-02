#!/bin/bash

logfile="/var/log/webserver.log"

# Teil 1: Start und Stopp protokollieren
if systemctl start apache2; then
  echo "Webserver gestartet" >> "$logfile"
else
  echo "Fehler: Webserver konnte nicht gestartet werden" >> "$logfile"
fi

if systemctl stop apache2; then
  echo "Webserver gestoppt" >> "$logfile"
else
  echo "Fehler: Webserver konnte nicht gestoppt werden" >> "$logfile"
fi

echo "Teil 1 und Teil 2 beendet ----------"


# Teil 3: Letzte 5 Log-Einträge anzeigen
echo "Letzte 5 Log-Einträge:"
tail -n 5 "$logfile"

echo "Teil 3 beendet ----------"


# Teil 4: Fehlerbehandlung für Aktionen
if ! systemctl start apache2; then
  echo "Fehler: Webserver konnte nicht gestartet werden" >> "$logfile"
else
  echo "Webserver gestartet" >> "$logfile"
fi

if ! systemctl stop apache2; then
  echo "Fehler: Webserver konnte nicht gestoppt werden" >> "$logfile"
else
  echo "Webserver gestoppt" >> "$logfile"
fi
echo "Teil 4 beendet ----------"
