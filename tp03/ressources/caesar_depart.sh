#!/bin/bash

minuscules='abcdefghijklmnopqrstuvwxyz'
majuscules='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
alphabet="${minuscules}${majuscules}"

#
# Construit les alphabets attendus par la commande tr.
#
construire_alphabet_decale() {
    local decalage_alphabet="$1"

    printf '%s%s%s%s' \
        "${minuscules:decalage_alphabet}" \
        "${minuscules:0:decalage_alphabet}" \
        "${majuscules:decalage_alphabet}" \
        "${majuscules:0:decalage_alphabet}"
}

usage() {
    printf 'Utilisation : %s decalage fichier_source fichier_destination\n' "$0"
}

# Étape 1 : vérifiez le nombre d'arguments avant de consulter leur valeur.

# Étape 2 : nommez les trois arguments.

# Étape 3 : vérifiez que le décalage est un entier compris entre 1 et 25.

# Étape 4 : vérifiez que la source est un fichier ordinaire et lisible.

# Étape 5 : construisez l'alphabet décalé, puis appelez tr avec deux redirections.
