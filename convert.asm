%include 'puts.inc'

section .data
    v1 dw '105', LF, NULL
    len equ 0x3

section .text

global _start

_start:
    call convert_value
    call show_value

    mov EAX, SYS_EXIT
    mov EBX, 0x0
    int SYS_CALL

convert_value:
    lea ESI, [v1]
    mov ECX, len
    call string_to_int
    add EAX, 0x2
    ret

show_value:
    call int_to_string
    call puts
    ret

; Convert string into int
; Input: ESI (value to convert), ECX (Length of the string)
; Output: EAX (value converted)
string_to_int:
    xor EBX, EBX
.prox_digito:
    movzx EAX, byte[ESI]
    inc ESI
    sub AL, '0'
    imul EBX, 0xA
    add EBX, EAX
    loop .prox_digito ; while (ecx--)
    mov EAX, EBX
    ret


; Convert int into string
; Input: EAX (value to convert)
; Output: BUFFER (ECX), TAM_BUFFER (EDX)
int_to_string:
    lea ESI, [BUFFER]
    add ESi, 0x9
    mov byte[ESI], 0xA
    mov EBX, 0xA
.prox_digito:
    xor EDX, EDX
    div EBX
    add DL, '0'
    dec ESI
    mov [ESI], DL
    test EAX, EAX
    jnz .prox_digito
    ret
