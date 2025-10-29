section .data
    hello db "Hello world", 0


section .text
global _start

_start:
    mov rax, 1 ; syscall
    mov rdi, 1
    mov rsi, hello
    mov rdx, 11
    syscall

    jmp exit

exit:
    mov rax, 60
    mov rdi, 0
    syscall