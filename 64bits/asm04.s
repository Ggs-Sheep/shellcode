BITS 64

section .data
    num db 0

section .text
global _start

_start:
    ; Lecture du nombre
    mov rax, 0      ; syscall: read
    xor rdi, rdi    ; fd: stdin
    lea rsi, [rel num]
    mov rdx, 1      ; taille du nombre
    syscall

    ; Vérifier si le nombre est pair
    movzx eax, byte [num]
    test al, 1
    jnz is_odd

    ; Sortie avec 0
    xor rax, rax    ; Met 0 dans rax
    inc rax         ; syscall: exit (rax = 1)
    xor rdi, rdi    ; status: 0
    syscall

is_odd:
    ; Sortie avec 1
    mov rax, 1      ; syscall: exit
    mov rdi, 1      ; status: 1
    syscall
