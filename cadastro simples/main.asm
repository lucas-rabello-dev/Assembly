section .data
    out0 db "Cadastro com Assembly!", 10, 0
    len_out0 equ $ - out0

    out1 db "digite seu nome: ", 0
    len_out1 equ $ - out1

    out2 db "digite sua idade: ", 0
    len_out2 equ $ - out2

    out3 db "digite seu CPF: ", 0
    len_out3 equ $ - out3

section .bss
    nome resb 40 ; 40 bytes
    len_nome equ $ - nome

    idade resb 4
    len_idade equ $ - idade

    cpf resb 20
    len_cpf equ $ - cpf 

section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, out0
    mov rdx, len_out0
    syscall

    ; print do nome
    mov rax, 1
    mov rdi, 1
    mov rsi, out1
    mov rdx, len_out1
    syscall
    ; input nome
    mov rax, 0
    mov rdi, 0
    mov rsi, nome
    mov rdx, len_nome
    syscall

    ; print do idade
    mov rax, 1
    mov rdi, 1
    mov rsi, out2
    mov rdx, len_out2
    syscall
    ; input idade
    mov rax, 0
    mov rdi, 0
    mov rsi, idade
    mov rdx, len_idade
    syscall

    ; print do cpf
    mov rax, 1
    mov rdi, 1
    mov rsi, out3
    mov rdx, len_out3
    syscall
    ; input cpf
    mov rax, 0
    mov rdi, 0
    mov rsi, cpf
    mov rdx, len_cpf
    syscall

    ; mostra resultados
    ; nome
    mov rax, 1
    mov rdi, 1
    mov rsi, nome
    mov rdx, len_nome
    syscall
    ; idade
    mov rax, 1
    mov rdi, 1
    mov rsi, idade
    mov rdx, len_idade
    syscall
    ; cpf
    mov rax, 1
    mov rdi, 1
    mov rsi, cpf
    mov rdx, len_cpf
    syscall

    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall