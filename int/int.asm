section .data
    num db '1'            ; This is the ASCII representation of the number 1
    num_len equ $ - num   ; Length of the num string

section .text
global _start

_start:
    ; Use sys_write to display the number
    mov eax, 4            ; sys_write
    mov ebx, 1            ; STDOUT
    mov ecx, num          ; Pointer to our string
    mov edx, num_len      ; Length of our string
    int 0x80              ; System call

    ; Exit
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; Exit status 0
    int 0x80              ; System call
