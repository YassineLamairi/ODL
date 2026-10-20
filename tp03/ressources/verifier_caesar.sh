#!/bin/bash

# Vérifie les comportements essentiels des scripts caesar.sh et caesar_lot.sh.
# Ce programme est fourni : vous n'avez pas à savoir le réécrire entièrement.

if [[ $# -ne 1 ]]; then
    printf 'Utilisation : %s dossier_des_scripts\n' "$0" >&2
    exit 2
fi

dossier_scripts="$1"
script_caesar="$dossier_scripts/caesar.sh"
script_lot="$dossier_scripts/caesar_lot.sh"
dossier_ressources=$(cd "$(dirname "$0")" && pwd)
dossier_temporaire=$(mktemp -d) || exit 3
trap 'rm -rf "$dossier_temporaire"' EXIT

nombre_echecs=0

reussite() {
    printf 'OK     %s\n' "$1"
}

echec() {
    printf 'ÉCHEC  %s\n' "$1"
    nombre_echecs=$((nombre_echecs + 1))
}

verifier_etat() {
    description="$1"
    etat_attendu="$2"
    shift 2

    "$@" > /dev/null 2>&1
    etat_obtenu=$?
    if [[ $etat_obtenu -eq $etat_attendu ]]; then
        reussite "$description"
    else
        echec "$description : état obtenu $etat_obtenu, attendu $etat_attendu"
    fi
}

if [[ ! -x "$script_caesar" || ! -x "$script_lot" ]]; then
    printf 'Erreur : caesar.sh et caesar_lot.sh doivent être exécutables dans %s.\n' \
        "$dossier_scripts" >&2
    exit 3
fi

if bash -n "$script_caesar" "$script_lot"; then
    reussite "syntaxe Bash"
else
    echec "syntaxe Bash"
fi

verifier_etat "appel sans argument" 2 "$script_caesar"
verifier_etat "affichage de l'aide" 0 "$script_caesar" --help
verifier_etat "option inconnue" 2 "$script_caesar" --inconnue 3 a b
verifier_etat "décalage non entier" 2 \
    "$script_caesar" --encrypt trois a b
verifier_etat "décalage hors limites" 2 \
    "$script_caesar" --encrypt 26 a b
verifier_etat "décalage avec zéro initial" 2 \
    "$script_caesar" --encrypt 03 a b
verifier_etat "fichier source absent" 3 \
    "$script_caesar" --encrypt 3 absent.txt "$dossier_temporaire/sortie.txt"

printf 'Abc xyz!\n' > "$dossier_temporaire/exemple_clair.txt"
printf 'Def abc!\n' > "$dossier_temporaire/attendu_3.txt"
printf 'Hij efg!\n' > "$dossier_temporaire/attendu_7.txt"

if "$script_caesar" --encrypt 3 "$dossier_temporaire/exemple_clair.txt" \
        "$dossier_temporaire/obtenu_3.txt" &&
        cmp -s "$dossier_temporaire/attendu_3.txt" \
        "$dossier_temporaire/obtenu_3.txt" &&
        "$script_caesar" --encrypt 7 "$dossier_temporaire/exemple_clair.txt" \
        "$dossier_temporaire/obtenu_7.txt" &&
        cmp -s "$dossier_temporaire/attendu_7.txt" \
        "$dossier_temporaire/obtenu_7.txt"; then
    reussite "décalages 3 et 7"
else
    echec "décalages 3 et 7"
fi

if "$script_caesar" --encrypt 7 "$dossier_ressources/message_clair.txt" \
        "$dossier_temporaire/message_chiffre.txt" &&
        "$script_caesar" --decrypt 7 "$dossier_temporaire/message_chiffre.txt" \
        "$dossier_temporaire/message_dechiffre.txt" &&
        cmp -s "$dossier_ressources/message_clair.txt" \
        "$dossier_temporaire/message_dechiffre.txt"; then
    reussite "chiffrement puis déchiffrement"
else
    echec "chiffrement puis déchiffrement"
fi

if "$script_caesar" --encrypt 5 \
        "$dossier_ressources/message avec espaces.txt" \
        "$dossier_temporaire/message avec espaces chiffre.txt"; then
    reussite "chemins contenant des espaces"
else
    echec "chemins contenant des espaces"
fi

cp "$dossier_ressources/message_clair.txt" "$dossier_temporaire/meme_fichier.txt"
if "$script_caesar" --encrypt 13 "$dossier_temporaire/meme_fichier.txt" \
        "$dossier_temporaire/meme_fichier.txt" &&
        [[ -s "$dossier_temporaire/meme_fichier.txt" ]]; then
    reussite "source et destination identiques"
else
    echec "source et destination identiques"
fi

"$script_lot" --encrypt 9 "$dossier_temporaire/lot" \
    "$dossier_ressources/message_clair.txt" absent.txt \
    "$dossier_ressources/message avec espaces.txt" > /dev/null 2>&1
etat_lot=$?
if [[ $etat_lot -ne 0 &&
      -f "$dossier_temporaire/lot/message_clair.txt" &&
      -f "$dossier_temporaire/lot/message avec espaces.txt" ]]; then
    reussite "lot poursuivi après un fichier absent"
else
    echec "lot poursuivi après un fichier absent"
fi

fichier_abandonne=$(find "$dossier_temporaire" -type f -name '*.tmp.*' -print -quit)
if [[ -z "$fichier_abandonne" ]]; then
    reussite "aucun fichier temporaire abandonné"
else
    echec "fichier temporaire abandonné : $fichier_abandonne"
fi

if [[ $nombre_echecs -eq 0 ]]; then
    printf '\nTous les contrôles ont réussi.\n'
    exit 0
fi

printf '\n%d contrôle(s) en échec.\n' "$nombre_echecs" >&2
exit 1
