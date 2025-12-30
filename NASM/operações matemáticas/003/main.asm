; somando valores que já estavam na memória 

section .data
    num1 db 11
    num2 db 33

section .text
global _start

_start:
    mov rax, [num1] ; pega o valor 
    mov rbx, [num2]
    add rax, rbx ; o resultado ta em rax

    mov rax, 60
    xor rdi, rdi
    syscall