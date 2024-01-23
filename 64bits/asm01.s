BITS 64

section .text
global _start

_start:
    xor rax, rax    ; Met 0 dans rax (évite les nullbytes)
    inc rax         ; syscall: exit (rax = 1)
    xor rdi, rdi    ; status: 0 (évite les nullbytes)
    syscall         ; Appelle le kernel
