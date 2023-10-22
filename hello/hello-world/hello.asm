section .data
hello db 'Hello, World!',0

section .text
global _start

_start:
    ; write syscall
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, hello       ; pointer to the string
    mov edx, 13          ; length of the string
    int 0x80             ; interrupt to invoke syscall

    ; exit syscall
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code
    int 0x80             ; interrupt to invoke syscall

