%define NUM_LOOPS 5

section .data
    count db 0

    count_ascii db 0 ; para conseguir imprimir

    text db "Contador em: ", 0
    len_text equ $ - text

    nl db 10 ; \n

section .text
global _start

_start:
for:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, len_text
    syscall

    ; convertendo o count para ASCII
    mov al, [count]
    add al, '0' ; converte
    mov [count_ascii], al ; coloca dentro da variável o valor convertido

    mov rax, 1
    mov rdi, 1
    mov rsi, count_ascii
    mov rdx, 1 ; um byte
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall

    ; usei o al e bl pois é apenas os valores são apenas de um byte 
    mov al, [count]
    mov bl, NUM_LOOPS

    add al, 1

    ; coloca o valor incrementado de volta para a variavel
    mov [count], al

    cmp al, bl
    je exit
    jne for


exit:
    mov rax, 60
    xor rdi, rdi
    syscall