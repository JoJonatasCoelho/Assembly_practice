%include 'puts.inc'

section .data
    msg db 'Hello World!'
    tam equ $- msg
section .bss

section .text

global _start

_start:
    lea ESI, [BUFFER]; load effective adress
    add ESI, 0x9
    mov byte[esi], LF

    dec esi
    mov dl, 0x11
    add dl, '0'
    mov [esi], dl

    call puts

    mov EAX, SYS_EXIT
    mov EBX, 0x0
    int SYS_CALL
