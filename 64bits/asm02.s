BITS 64

section .data
    msg db '1337', 0xA

section .text
global _start

_start:
    ; Afficher 1337
    mov rax, 1      ; syscall: write
    mov rdi, 1      ; fd: stdout
    lea rsi, [rel msg]  ; pointeur vers msg
    mov rdx, 5      ; longueur du message (1337 + '\n')
    syscall

    ; Sortie
    xor rax, rax    ; Met 0 dans rax
    inc rax         ; syscall: exit (rax = 1)
    xor rdi, rdi    ; status: 0
    syscall
