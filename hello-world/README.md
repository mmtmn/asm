x86 Assembly for Linux (using NASM)

to assemble and run:

nasm -f elf32 hello.asm
ld -m elf_i386 -o hello hello.o
./hello

