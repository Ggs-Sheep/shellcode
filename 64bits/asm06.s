BITS 64

section .data
    shell db '/bin/sh', 0

section .text
global _start

_start:
    ; Exécuter /bin/sh
    mov rax, 59     ; syscall: execve
    lea rdi, [rel shell]
    xor rsi, rsi    ; pas d'arguments
    xor rdx, rdx    ; pas d'environnement
    syscall
