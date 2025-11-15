nameFile1 = main
nameFile2 = input
init:
	nasm -f elf64 $(nameFile1).asm -o $(nameFile1).o && nasm -f elf64 $(nameFile2).asm -o $(nameFile2).o && ld $(nameFile1).o $(nameFile2).o -o $(nameFile1)
run:
	./$(nameFile1)

clear:
	rm ./$(nameFile1) && rm $(nameFile1).o && rm $(nameFile2).o 