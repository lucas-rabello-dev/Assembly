section .data
    print db ">>> ", 0
    len_print equ $ - print

section .bss
    input resb 30
    len_input equ $ - input

section .text

input_label:
    mov rax, 1
    mov rdi, 1
    mov rsi, print
    mov rdx, len_print
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, len_input
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, len_input
    syscall
    ret
