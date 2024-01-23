section .data
    msg db '1337', 0xA
    len equ $ - msg

section .text
global _start

_start:
    mov eax, 4    ; syscall: write
    mov ebx, 1    ; fd: stdout
    mov ecx, msg  ; message
    mov edx, len  ; length
    int 0x80

    mov eax, 1    ; syscall: exit
    xor ebx, ebx  ; status: 0
    int 0x80
