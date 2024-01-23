section .data
    filename db 'asm01', 0

section .text
global _start

_start:
    mov eax, 11   ; syscall: execve
    mov ebx, filename
    mov ecx, 0
    mov edx, 0
    int 0x80
