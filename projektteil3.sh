#!/bin/bash

# Prüfen, ob die Gruppe existiert, wenn nicht, dann erstellen
if ! getent group webgroup > /dev/null 2>&1; then
    sudo groupadd webgroup
    echo "Gruppe webgroup wurde erstellt."
else
    echo "Gruppe webgroup existiert bereits."
fi

# Prüfen, ob der Benutzer webadmin existiert, wenn nicht, dann erstellen
if ! id "webadmin" &>/dev/null; then
    sudo useradd -m -G webgroup webadmin
    echo "Benutzer webadmin wurde erstellt und in die Gruppe webgroup hinzugefügt."
else
    echo "Benutzer webadmin existiert bereits."
fi

# Prüfen, ob der Benutzer 'webuser' existiert, wenn nicht, dann erstellen
if ! id "webuser" &>/dev/null; then
    sudo useradd -m -G webgroup webuser
    echo "Benutzer webuser wurde erstellt und in die Gruppe webgroup hinzugefügt."
else
    echo "Benutzer webuser existiert bereits."
fi

echo "Teil 1 beendet ----------"

# Besitzer und Gruppe ändern
sudo chown webadmin:webgroup /var/www/html/

# Berechtigungen setzen
sudo chmod 755 /var/www/html/
sudo chmod 644 /var/www/html/*

echo "Berechtigungen und Besitzer wurden angepasst."

echo "Teil 2 beendet ----------"