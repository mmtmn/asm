section .data               ; Initialized data section

section .text               ; Code section
global _start

_start:
    mov eax, 5              ; Load 5 into eax
    mov ebx, 3              ; Load 3 into ebx
    add eax, ebx            ; Add ebx to eax, result (8) is in eax

    ; Normally here, you'd output the result or perform some action.

    ; Exit the program
    mov eax, 1              ; (syscall for sys_exit)
    int 0x80                ; Trigger an interrupt to call the system function
