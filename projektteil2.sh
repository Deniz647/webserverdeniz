#!/bin/bash

# Zielordner
ZIEL="/mnt/c/Users/deniz/OneDrive/Desktop/Dev/projekt30.04/backup/webserver_backup_$(date +%Y-%m-%d_%H-%M-%S)"

# Neues Backup kopieren
cp -r /var/www/html "$ZIEL"

echo "Backup wurde erstellt."