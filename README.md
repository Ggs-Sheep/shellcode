# README - Programmes en Assembleur et Scripts en Bash

Ce README décrit les différents programmes en assembleur et les scripts en bash fournis dans ce répertoire.

## Programmes en Assembleur

### asm01.s (Retourner 0)

- **Description :** Ce programme assembleur retourne 0 en utilisant l'appel système `exit`. Il s'agit d'un programme minimal qui termine normalement.

### asm02.s (Afficher 1337 et Retourner 0)

- **Description :** Ce programme assembleur affiche "1337" à l'écran en utilisant l'appel système `write` puis retourne 0 en utilisant l'appel système `exit`.

### asm03.s (Afficher 1337 et Retourner 0 si Entrée 42, Sinon 1)

- **Description :** Ce programme assembleur lit un caractère de l'entrée standard, vérifie s'il est égal à '4', lit un deuxième caractère, vérifie s'il est égal à '2', affiche "1337" si les conditions sont remplies, puis retourne 0 ou 1 en fonction de l'entrée.

### asm04.s (Retourner 0 si Nombre Pair, Sinon 1)

- **Description :** Ce programme assembleur lit un caractère de l'entrée standard, vérifie s'il est pair et retourne 0 ou 1 en fonction de cette condition.

### asm05.s (Exécuter asm01)

- **Description :** Ce programme assembleur exécute le programme `asm01.s` en utilisant l'appel système `execve`.

### asm06.s (Exécuter /bin/sh)

- **Description :** Ce programme assembleur exécute le shell `/bin/sh` en utilisant l'appel système `execve`.

## Utilisation de build.sh, create_shellcode.sh et du Wrapper C

### build.sh

- **Description :** Le script `build.sh` permet de compiler tous les programmes assembleur (`asm01.s` à `asm06.s`) en une seule commande.
- **Usage :** Exécutez `./build.sh` pour compiler tous les programmes.

### create_shellcode.sh

- **Description :** Le script `create_shellcode.sh` génère le shellcode à partir des programmes assembleur.
- **Usage :** Exécutez `./create_shellcode.sh [nom_du_programme.s]` pour générer le shellcode à partir d'un programme assembleur spécifique.

### Utilisation du Wrapper C

- **Description :** Le fichier `wrapper.c` est un wrapper en langage C qui permet d'exécuter les programmes assembleur de manière contrôlée. Il charge le code assembleur à partir du fichier binaire `.bin`
- **Compilation du Wrapper :** Pour compiler le wrapper C, exécutez `gcc -o wrapper wrapper.c`.
- **Usage :** Une fois le wrapper compilé, utilisez `./wrapper [nom_du_programme.bin]` pour exécuter le programme assembleur correspondant.
