#!/usr/bin/env bash
set -eu

dossier_projet="/home/raspi/projet-ul1in021-serrure"
nom_service="serrure.service"

cd "$dossier_projet"

echo "Récupération du code depuis GitHub..."
git pull --ff-only

if systemctl cat "$nom_service" > /dev/null 2>&1; then
    echo "Redémarrage du service $nom_service..."
    sudo systemctl restart "$nom_service"
    systemctl status "$nom_service" --no-pager
else
    echo "Service $nom_service introuvable : redémarrage ignoré."
fi
