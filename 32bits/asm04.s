section .data
    num db 0

section .text
global _start

_start:
    mov eax, 3    ; syscall: read
    mov ebx, 0    ; fd: stdin
    mov ecx, num
    mov edx, 1
    int 0x80

    movzx eax, byte [num]
    test eax, 1
    jnz is_odd

    mov eax, 1    ; syscall: exit
    xor ebx, ebx  ; status: 0
    int 0x80

is_odd:
    mov eax, 1    ; syscall: exit
    mov ebx, 1    ; status: 1
    int 0x80
