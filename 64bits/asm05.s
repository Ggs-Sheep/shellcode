BITS 64

section .data
    filename db 'asm01', 0

section .text
global _start

_start:
    ; Exécuter asm01
    mov rax, 59     ; syscall: execve
    lea rdi, [rel filename]
    xor rsi, rsi    ; pas d'arguments
    xor rdx, rdx    ; pas d'environnement
    syscall
