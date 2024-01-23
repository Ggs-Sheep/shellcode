#!/bin/bash

# Vérifie si NASM est installé
if ! command -v nasm > /dev/null 2>&1; then
    echo "NASM n'est pas installé. Veuillez l'installer pour continuer."
    exit 1
fi

# Vérifie si les paramètres sont fournis
if [ $# -eq 0 ]; then
    echo "Usage: $0 <fichier1.asm> <fichier2.asm> ..."
    exit 1
fi

# Processus de conversion pour chaque fichier
for asm_file in "$@"; do
    # Vérifie si le fichier existe
    if [ ! -f "$asm_file" ]; then
        echo "Le fichier $asm_file n'existe pas."
        continue
    fi

    # Nom du fichier sans extension
    filename=$(basename -- "$asm_file")
    filename="${filename%.*}"

    # Assemblage et extraction du shellcode
    nasm -f bin "$asm_file" -o "${filename}.bin" && \
    echo -n 'Shellcode pour '"$filename"': ' && \
    hexdump -v -e '"\\x" 1/1 "%02x"' "${filename}.bin" && echo

    # Vérifie si des nullbytes sont présents
    if grep -q "\\x00" "${filename}.bin"; then
        echo "Attention: des nullbytes ont été détectés dans ${filename}.bin"
    fi
done
