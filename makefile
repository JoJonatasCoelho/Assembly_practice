PROGRAM = input
all: ${PROGRAM}.o
	ld -s -o ${PROGRAM}.e ${PROGRAM}.o
	rm -rf *.o
%.o: %.asm
	nasm -f elf64 $<
clear: 
	rm -rf *.o
	rm -rf *.e
