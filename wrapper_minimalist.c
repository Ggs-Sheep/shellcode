#include <stdio.h>
#include <string.h>

// Shellcode
unsigned char shellcode[] = ;

int main() {
    // Affiche la longueur du shellcode
    printf("Longueur du shellcode: %d octets\n", (int)strlen(shellcode));

    // Convertit l'adresse du tableau shellcode en un pointeur de fonction
    int (*execute_shellcode)() = (int(*)())shellcode;

    // Exécute le shellcode
    execute_shellcode();

    return 0;
}
