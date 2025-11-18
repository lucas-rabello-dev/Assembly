section .data
    msg db "Resultado: ", 0
    result db 0

section .text
global _start
_start:

    mov rax, 4
    mov rbx, 3
    add rax, rbx

    add rax, '0' ; soma 7 + 48 ('0' na ASCII table é 48) resultando em 55 que é '7' na ASCII table 
    mov [result], al 

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 11
    syscall

    mov rax, 1
    mov rdi, 1    
    mov rsi, result ; coloca o result aqui para imprimir o valor dele   
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
