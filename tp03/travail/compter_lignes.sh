#!/bin/bash
usage(){
    echo 'Utilisation : ./travail/compter_lignes.sh fichier ...'
}
if [[ $# -eq 0 ]]
then
    usage >&2
    exit 2
fi
etat_sortie=0
for fichier in "$@"
do
    if [[ ! -f "$fichier" ]]
    then
        echo "'$fichier' n'est pas oridinaire ">&2
        etat_sortie=1
        continue
    fi
    if [[ ! -r "$fichier" ]]
    then
        echo "'$fichier' n'est pas lisible ">&2
        etat_sortie=1
        continue
    fi
    nombre=$(wc -l < "$fichier")
    if [[ $nombre -eq 0 ]]
    then 
        echo "'$fichier' on ne peut pas compter son nombre de ligne " >&2 
        etat_sortie=1
        continue
    else 
        printf "Nombre de ligne de '$fichier' est de : %d\n" "$nombre"
    fi 
done
exit "$etat_sortie"

