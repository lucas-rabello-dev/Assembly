section .data
    output db "digite alguma coisa (q para sair)", 0
    len_output equ $ - output

    finish_c db "finish program", 0
    len_finish equ $ - finish_c

    outro_s db "você não digitou q", 10
    len_outro equ $ - outro_s

    exit_value db "q"

section .bss
    input resb 20
    len_input equ $ - input

section .text
global _start

_start:

    jmp while

while:

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, len_input
    syscall

    mov al, [input]
    sub al, '0'

    mov bl, [exit_value]
    sub bl, '0'

    cmp al, bl
    
    jne outro
    je finish

    ret

; finish msg
finish:
    mov rax, 1
    mov rdi, 1
    mov rsi, finish_c
    mov rdx, len_finish
    syscall

    jmp exit

; fala que você digitou outra coisa
outro:
    mov rax, 1
    mov rdi, 1
    mov rsi, outro_s
    mov rdx, len_outro
    syscall

    call while

;exit
exit:
    mov rax, 60
    mov rdi, 0
    syscall