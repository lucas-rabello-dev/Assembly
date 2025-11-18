section .text 
global _start

_start:
    mov rax, 12
    mov rbx, 33
    add rax, rbx

    mov rax, 60
    xor rdi, rdi
    syscall