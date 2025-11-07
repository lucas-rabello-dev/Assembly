section .data
    num db 3        ; número binário 3
    ascii db 0      ; espaço pra guardar o caractere convertido

section .text
global _start

_start:
    mov al, [num]    ; pega o valor 3
    add al, '0'      ; converte pra ASCII (3 + 48 = '3')
    mov [ascii], al  ; guarda o caractere convertido

    ; imprime
    mov rax, 1       ; syscall write
    mov rdi, 1       ; saída padrão
    mov rsi, ascii   ; endereço do caractere
    mov rdx, 1       ; tamanho (1 byte)
    syscall

    ; sair
    mov rax, 60
    xor rdi, rdi
    syscall
