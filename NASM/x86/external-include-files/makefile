init:
	nasm -f elf32 main.asm -o main.o && nasm -f elf32 lib.asm -o lib.o && ld -m elf_i386 main.o lib.o -o main && ./main
