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

if [[ $# -ne 3 ]]
then
    usage >&2
    exit 2
fi
decalage=$1 
fichier_source=$2
fichier_destination=$3
case "$decalage" in 
    ( 0* | *[!0-9]* | "" )
    echo "ERREUR : Décalage non valide (entier est qui ne commence pas par 0) : " >&2
    etat_sortie=2
esac 

if [[ $decalage -ge 25 ]] 
then
    echo "ERREUR : Décalage non valide (entier entre 1 et 25) : " >&2
    etat_sortie=2
fi
if [[ ! -f "$2" ]]
    then
        echo "'$2' n'est pas oridinaire ">&2
        etat_sortie=3
    fi
    if [[ ! -r "$2" ]]
    then
        echo "'$2' n'est pas lisible ">&2
        etat_sortie=3
    fi
if [[ ! -f "$3" ]]
    then
        echo "'$3' n'est pas oridinaire ">&2
        etat_sortie=3
    fi
    if [[ ! -r "$3" ]]
    then
        echo "'$3' n'est pas lisible ">&2
        etat_sortie=3
    fi
alphabet_decale=$(construire_alphabet_decale)
tr "$alphabet" "$alphabet_decale" < "$fichier_source" > "$fichier_destination"
# Étape 1 : vérifiez le nombre d'arguments avant de consulter leur valeur.

# Étape 2 : nommez les trois arguments.

# Étape 3 : vérifiez que le décalage est un entier compris entre 1 et 25.

# Étape 4 : vérifiez que la source est un fichier ordinaire et lisible.

# Étape 5 : construisez l'alphabet décalé, puis appelez tr avec deux redirections.
