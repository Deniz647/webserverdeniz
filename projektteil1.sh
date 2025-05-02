#!/bin/bash

# Apache installieren
sudo apt update && sudo apt install apache2 -y

# Bestätigung
echo "Apache wurde erfolgreich installiert!"

echo "Teil 1 beendet ----------"

# Apache so konfigurieren, dass er beim Booten automatisch startet
sudo systemctl enable apache2

# Apache starten
sudo systemctl start apache2

# Bestätigung
echo "Apache wurde gestartet und so konfiguriert, dass er beim Booten automatisch startet!"

echo "Teil 2 beendet ----------"

# Bereitstellung der Webseite (HTML und CSS Dateien kopieren)
sudo cp /mnt/c/Users/deniz/OneDrive/Desktop/Dev/projekt30.04/*.html /var/www/html/
sudo cp /mnt/c/Users/deniz/OneDrive/Desktop/Dev/projekt30.04/*.css /var/www/html/

# Bestätigung
echo "Webseite wurde bereitgestellt!"

echo "Teil 3 beendet ----------"

if [ "$(systemctl is-active apache2)" = "active" ]; then
    echo "Apache läuft, die Webseite ist erreichbar unter http://localhost"
else
    echo "Fehler: Apache läuft nicht!"
    exit 1
fi

echo "Teil 4 beendet ----------"