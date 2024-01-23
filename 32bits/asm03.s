section .data
    msg db '1337', 0xA
    len equ $ - msg
    input db 0

section .text
global _start

_start:
    mov eax, 3    ; syscall: read
    mov ebx, 0    ; fd: stdin
    mov ecx, input
    mov edx, 1
    int 0x80

    ; Convert ASCII to number and compare
    movzx eax, byte [input]   ; Load input into eax
    cmp eax, '4'              ; Check first digit
    jne not_42
    movzx eax, byte [input+1] ; Load next byte of input
    cmp eax, '2'              ; Check second digit
    jne not_42

    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Exit with status 0
    mov eax, 1
    xor ebx, ebx
    int 0x80

not_42:
    ; Exit with status 1
    mov eax, 1
    mov ebx, 1
    int 0x80
