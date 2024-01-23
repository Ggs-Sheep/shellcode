section .text
global _start

_start:
    mov eax, 1    ; syscall: exit
    xor ebx, ebx  ; status: 0
    int 0x80