segment .data
    LF equ 0xa ; Line fit
    SYS_CALL equ 0x80 ; Make a syscall
    NULL equ 0xD ; End string
    ; EAX
    SYS_EXIT equ 0x1 ; Syscall to finish the process
    SYS_WRITE equ 0x4 ; Write
    SYS_READ equ 0x3 ; Read 
    ; EBX
    RET_EXiT equ 0x0 ; Return value of the process
    STD_OUT equ 0x1 ; Standard output, console
    STD_IN equ 0x0 ; Standard input
    
    TAM_BUFFER equ 0x32

segment .bss
    BUFFER resb 0x1

segment .text

puts:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, BUFFER
    mov EDX, TAM_BUFFER
    int SYS_CALL
    ret
