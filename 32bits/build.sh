#!/bin/bash

# Compilation de asm01.s
nasm -f elf64 asm01.s -o asm01.o
ld asm01.o -o asm01

# Compilation de asm02.s
nasm -f elf64 asm02.s -o asm02.o
ld asm02.o -o asm02

# Compilation de asm03.s
nasm -f elf64 asm03.s -o asm03.o
ld asm03.o -o asm03

# Compilation de asm04.s
nasm -f elf64 asm04.s -o asm04.o
ld asm04.o -o asm04

# Compilation de asm05.s
nasm -f elf64 asm05.s -o asm05.o
ld asm05.o -o asm05

# Compilation de asm06.s
nasm -f elf64 asm06.s -o asm06.o
ld asm06.o -o asm06

echo "Compilation terminée."
