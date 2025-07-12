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
    var1 dd 50 ; dd = define double word, dw = define word, db = define byte, dq = define quat word, dt = define ten word
    var2 dd 10
    msg1 db "var 1 é maior que var 2", LF, NULL
    tam1 equ $ - msg1
    msg2 db "var 2 é maior que var 1", LF, NULL
    tam2 equ $ - msg2

section .bss

section .text

global _start

_start:
    mov EAX, DWORD[var1]
    mov EBX, DWORD[var2]
 

    ; je = jump if equals, jg = jump if greater, jge, jl = jump if less, jle, jne = diferent | conditional
    ; jmp = GOTO unconditional
    cmp EAX, EBX ; comparing 
    jg greater

    mov ECX, msg2
    mov EDX, tam2
    jmp final

greater:
    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXT
    int SYS_CALL
