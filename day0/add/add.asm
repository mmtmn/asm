section .data               ; Initialized data section
    buffer db 10 dup(0)    ; Buffer to store the string representation of the integer

section .text               ; Code section
global _start

_start:
    mov eax, 5              ; Load 5 into eax
    mov ebx, 3              ; Load 3 into ebx
    add eax, ebx            ; Add ebx to eax, result (8) is in eax

    ; Convert eax to string representation and store in buffer
    lea edi, [buffer + 9]  ; Start from the end of the buffer
    .convert:
        xor edx, edx        ; Clear any previous remainder
        div dword [ten]     ; Divide eax by 10
        add dl, '0'         ; Convert remainder to ASCII
        dec edi             ; Move buffer pointer backwards
        mov [edi], dl       ; Store ASCII character in buffer
        test eax, eax       ; Check if quotient is zero
        jnz .convert        ; If not, continue loop

    ; Output buffer
    mov eax, 4              ; sys_write
    mov ebx, 1              ; STDOUT
    lea ecx, [edi]          ; Point to the start of the string in buffer
    mov edx, buffer + 10    ; Point to end of the buffer
    sub edx, edi            ; Calculate length of the string
    int 0x80                ; System call
   

    ; Exit the program
    mov eax, 1              ; (syscall for sys_exit)
    int 0x80                ; Trigger an interrupt to call the system function

section .data
    ten dd 10               ; Constant 10 for division
