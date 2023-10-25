.global _start

.section .data
hello: .asciz "Hello, World!"

.section .text
_start:
    ldr r0, =0x04             ; SYS_WRITE0 semihosting call
    ldr r1, =hello            ; pointer to the string
    bkpt 0xAB                 ; breakpoint instruction for semihosting

loop:
    b loop                    ; infinite loop
