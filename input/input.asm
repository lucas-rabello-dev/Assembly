section .data
    cout db "Digite alguma coisa: ", 0

section .bss
    input resb 32
    len equ $ - input


section .text
global _start

_start:

    call print1

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, len
    syscall

    call print2

    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

print1:
    mov rax, 1
    mov rdi, 1
    mov rsi, cout
    mov rdx, 21
    syscall
    ret

print2:
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, 21
    syscall
    ret
