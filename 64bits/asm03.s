BITS 64

section .data
    msg db '1337', 0xA
    input db 0

section .text
global _start

_start:
    ; Lecture de l'entrée
    xor rax, rax          ; syscall: read
    xor rdi, rdi          ; fd: stdin
    lea rsi, [rel input]  ; pointeur vers input
    mov rdx, 1            ; taille de l'entrée
    syscall

    ; Vérifier si l'entrée est '4'
    movzx eax, byte [input]
    cmp al, '4'
    jne not_42

    ; Vérifier si l'entrée est '2' (offset +1)
    movzx eax, byte [input+1]
    cmp al, '2'
    jne not_42

    ; Afficher 1337
    mov rax, 1            ; syscall: write
    mov rdi, 1            ; fd: stdout
    lea rsi, [rel msg]    ; pointeur vers msg
    mov rdx, 5            ; longueur du message
    syscall

    ; Sortie avec 0
    xor rax, rax          ; Met 0 dans rax
    inc rax               ; syscall: exit (rax = 1)
    xor rdi, rdi          ; status: 0
    syscall

not_42:
    ; Sortie avec 1
    mov rax, 1            ; syscall: exit
    mov rdi, 1            ; status: 1
    syscall
