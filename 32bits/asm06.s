section .data
    shell db '/bin/sh', 0

section .text
global _start

_start:
    mov eax, 11   ; syscall: execve
    mov ebx, shell
    mov ecx, 0
    mov edx, 0
    int 0x80
