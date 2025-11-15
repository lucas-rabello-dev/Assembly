%include "funcs.asm" ; para o todos os labels do arquivo

; extern print ; apenas para um label especifico

section .text

global _start
_start:
    call print
    call printf

    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall