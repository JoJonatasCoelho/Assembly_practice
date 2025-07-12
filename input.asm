segment .data
    LF equ 0xa ; Line fit
    SYS_CALL equ 0x80 ; Make a syscall
    NULL equ 0xD ; End string
    ; EAX
    SYS_EXIT equ 0x1 ; Syscall to finish the process
    SYS_WRITE equ 0x4 ; Write
    SYS_READ equ 0x3 ; Read 
    ; EBX
    RET_EXT equ 0x0 ; Return value of the process
    STD_OUT equ 0x1 ; Standard output, console
    STD_IN equ 0x0 ; Standard input

section .data
    msg db 'Digite seu nome:', LF, NULL
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    ; write the message
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg
    mov EDX, tam
    int SYS_CALL

    ; input
    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, nome
    mov EDX, 0xA
    int SYS_CALL

    ; write the name
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, nome
    mov EDX, nome
    mov EDX, 0XA
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXT
    int SYS_CALL
