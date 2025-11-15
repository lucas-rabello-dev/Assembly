%include "input.asm"

section .text

global _start
_start:
    call input_label

    mov rax, 60
    xor rdi, rdi
    syscall