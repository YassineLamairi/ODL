#!/bin/bash

usage() {
    printf 'Utilisation : %s operation decalage dossier_destination fichier...\n' "$0"
}

# caesar.sh se trouve dans le même dossier que ce script.
script_caesar="$(dirname "$0")/caesar.sh"

# À compléter n° 1 : validez le nombre d'arguments.
# À compléter n° 2 : nommez les trois premiers arguments, puis employez shift.
# À compléter n° 3 : validez l'opération et le décalage.
# À compléter n° 4 : créez le dossier de destination en contrôlant l'échec.
# À compléter n° 5 : traitez tous les fichiers et produisez l'état de sortie final.
