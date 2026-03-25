## How I compile this

Generate a 32-bit executable program 
# NASM
nasm -f elf32 main.asm -o main.o

# Linker (ld)
ld -m elf_i386 main.o -o main
> -m -> emulation 

