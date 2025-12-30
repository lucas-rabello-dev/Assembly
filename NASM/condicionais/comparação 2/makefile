nameFile = main

init:
	nasm -f elf64 $(nameFile).asm -o $(nameFile).o && ld $(nameFile).o -o $(nameFile)
run:
	./$(nameFile)

clear:
	rm ./$(nameFile) && rm $(nameFile).o 