section .data
    teste db "teste", 0
    len_teste equ $ - teste

    hello db "Hello de outro file", 0
    len_hello equ $ - hello

section .text
; global print
print:
    mov rax, 1
    mov rdi, 1
    mov rsi, teste
    mov rdx, len_teste
    syscall
    ret ; para retornar e continuar na func main do outro arquivo

printf:
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, len_hello
    syscall
    ret
